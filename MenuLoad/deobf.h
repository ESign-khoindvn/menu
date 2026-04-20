#pragma once

#import <Foundation/Foundation.h>
#include <fcntl.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>

namespace Metadata {

typedef struct {
    uint32_t magic;
    int32_t cputype;
    int32_t cpusubtype;
    uint32_t filetype;
    uint32_t ncmds;
    uint32_t sizeofcmds;
    uint32_t flags;
    uint32_t reserved;
} mach_header_64_t;

typedef struct {
    uint32_t cmd;
    uint32_t cmdsize;
} load_command_t;

typedef struct {
    uint32_t cmd;
    uint32_t cmdsize;
    char segname[16];
    uint64_t vmaddr;
    uint64_t vmsize;
    uint64_t fileoff;
    uint64_t filesize;
    uint32_t maxprot;
    uint32_t initprot;
    uint32_t nsects;
    uint32_t flags;
} segment_command_64_t;

typedef struct {
    uint64_t offset;
    uint64_t offsetEnd;
    uint64_t address;
    uint64_t addressEnd;
} search_section_t;

typedef struct {
    search_section_t *items;
    size_t count;
    size_t cap;
} section_list_t;

typedef struct {
    uint32_t nameIndex;
    int32_t assemblyIndex;
    int32_t typeStart;
    uint32_t typeCount;
    int32_t exportedTypeStart;
    uint32_t exportedTypeCount;
    int32_t entryPointIndex;
    uint32_t token;
    int32_t customAttributeStart;
    uint32_t customAttributeCount;
} Il2CppImageDefinition;

typedef struct {
    uint32_t nameIndex;
    uint32_t namespaceIndex;
    int32_t byvalTypeIndex;
    int32_t declaringTypeIndex;
    int32_t parentIndex;
    int32_t elementTypeIndex;
    int32_t genericContainerIndex;
    uint32_t flags;
    int32_t fieldStart;
    int32_t methodStart;
    int32_t eventStart;
    int32_t propertyStart;
    int32_t nestedTypesStart;
    int32_t interfacesStart;
    int32_t vtableStart;
    int32_t interfaceOffsetsStart;
    uint16_t method_count;
    uint16_t property_count;
    uint16_t field_count;
    uint16_t event_count;
    uint16_t nested_type_count;
    uint16_t vtable_count;
    uint16_t interfaces_count;
    uint16_t interface_offsets_count;
    uint32_t bitfield;
    uint32_t token;
} Il2CppTypeDefinition;

typedef struct {
    uint32_t nameIndex;
    int32_t declaringType;
    int32_t returnType;
    int32_t parameterStart;
    int32_t genericContainerIndex;
    uint32_t token;
    uint16_t flags;
    uint16_t iflags;
    uint16_t slot;
    uint16_t parameterCount;
} Il2CppMethodDefinition;

typedef struct {
    uint32_t nameIndex;
    int32_t typeIndex;
    uint32_t token;
} Il2CppFieldDefinition;

typedef struct {
    uint64_t reversePInvokeWrapperCount;
    uint64_t reversePInvokeWrappers;
    uint64_t genericMethodPointersCount;
    uint64_t genericMethodPointers;
    uint64_t genericAdjustorThunks;
    uint64_t invokerPointersCount;
    uint64_t invokerPointers;
    uint64_t unresolvedVirtualCallCount;
    uint64_t unresolvedVirtualCallPointers;
    uint64_t interopDataCount;
    uint64_t interopData;
    uint64_t windowsRuntimeFactoryCount;
    uint64_t windowsRuntimeFactoryTable;
    uint64_t codeGenModulesCount;
    uint64_t codeGenModules;
} Il2CppCodeRegistration;

typedef struct {
    uint64_t moduleName;
    int64_t methodPointerCount;
    uint64_t methodPointers;
    int64_t adjustorThunkCount;
    uint64_t adjustorThunks;
    uint64_t invokerIndices;
    uint64_t reversePInvokeWrapperCount;
    uint64_t reversePInvokeWrapperIndices;
    int64_t rgctxRangesCount;
    uint64_t rgctxRanges;
    int64_t rgctxsCount;
    uint64_t rgctxs;
    uint64_t debuggerMetadata;
    uint64_t moduleInitializer;
    uint64_t staticConstructorTypeIndices;
    uint64_t metadataRegistration;
    uint64_t codeRegistration;
} Il2CppCodeGenModule;

typedef struct {
    int64_t genericClassesCount;
    uint64_t genericClasses;
    int64_t genericInstsCount;
    uint64_t genericInsts;
    int64_t genericMethodTableCount;
    uint64_t genericMethodTable;
    int64_t typesCount;
    uint64_t types;
    int64_t methodSpecsCount;
    uint64_t methodSpecs;
    int64_t fieldOffsetsCount;
    uint64_t fieldOffsets;
    int64_t typeDefinitionsSizesCount;
    uint64_t typeDefinitionsSizes;
    uint64_t metadataUsagesCount;
    uint64_t metadataUsages;
} Il2CppMetadataRegistration;

typedef struct {
    uint8_t *data;
    size_t size;
    bool is_mmap;
} file_buffer_t;

typedef struct {
    uint64_t image_base;
    uint64_t code_reg_va;
    uint64_t meta_reg_va;
    file_buffer_t unity;
    file_buffer_t meta;
    section_list_t exec_secs;
    section_list_t data_secs;
    const uint32_t *hdr;
} unity_cache_t;

bool read_file(const char *path, file_buffer_t *out) {
    if (!path || !path[0]) {
        return false;
    }
    int fd = open(path, O_RDONLY);
    if (fd < 0) {
        return false;
    }
    struct stat st;
    if (fstat(fd, &st) != 0 || st.st_size <= 0) {
        close(fd);
        return false;
    }
    size_t size = (size_t)st.st_size;
    void *data = mmap(NULL, size, PROT_READ, MAP_PRIVATE, fd, 0);
    close(fd);
    if (data == MAP_FAILED) {
        return false;
    }
    out->data = (uint8_t *)data;
    out->size = size;
    out->is_mmap = true;
    return true;
}

void free_file(file_buffer_t *buf) {
    if (buf && buf->data) {
        if (buf->is_mmap) {
            munmap(buf->data, buf->size);
        } else {
            free(buf->data);
        }
        buf->data = NULL;
        buf->size = 0;
        buf->is_mmap = false;
    }
}

void sec_push(section_list_t *list, search_section_t sec) {
    if (list->count == list->cap) {
        size_t new_cap = list->cap ? list->cap * 2 : 8;
        search_section_t *new_items = (search_section_t *)realloc(list->items, new_cap * sizeof(search_section_t));
        if (!new_items) {
            return;
        }
        list->items = new_items;
        list->cap = new_cap;
    }
    list->items[list->count++] = sec;
}

void sec_free(section_list_t *list) {
    if (list->items) {
        free(list->items);
    }
    list->items = NULL;
    list->count = 0;
    list->cap = 0;
}

uint32_t xor_subtract_u32(uint32_t value, uint32_t sub, uint32_t key) {
    return ((value - sub) ^ key);
}

bool deobf_meta(file_buffer_t *meta) {
    if (!meta || !meta->data || meta->size < 0x100) {
        return false;
    }
    uint32_t *header = (uint32_t *)meta->data;
    if (header[0] != 0xEAB11BAF || header[1] != 29) {
        return false;
    }
    if (meta->is_mmap) {
        uint8_t *copy = (uint8_t *)malloc(meta->size);
        if (!copy) {
            return false;
        }
        memcpy(copy, meta->data, meta->size);
        munmap(meta->data, meta->size);
        meta->data = copy;
        meta->is_mmap = false;
        header = (uint32_t *)meta->data;
    }

    uint32_t input[64];
    uint32_t output[64] = {0};
    memcpy(input, header, sizeof(input));

    output[0] = input[0];
    output[1] = input[1];
    for (int i = 50; i < 64; i++) {
        output[i] = input[i];
    }

    output[4] = input[2] ^ 0x00A8C72D;
    output[5] = input[3] ^ 0x00A8C72D;
    output[8] = xor_subtract_u32(input[4], 3, 0x00A8C72E);
    output[9] = xor_subtract_u32(input[5], 7, 0x00A8C72F);
    output[12] = xor_subtract_u32(input[6], 6, 0x00A8C72F);
    output[13] = xor_subtract_u32(input[7], 14, 0x00A8C731);
    output[16] = xor_subtract_u32(input[8], 9, 0x00A8C730);
    output[17] = xor_subtract_u32(input[9], 21, 0x00A8C733);
    output[20] = xor_subtract_u32(input[10], 12, 0x00A8C731);
    output[21] = xor_subtract_u32(input[11], 28, 0x00A8C735);
    output[6] = xor_subtract_u32(input[12], 15, 0x00A8C732);
    output[7] = xor_subtract_u32(input[13], 35, 0x00A8C737);
    output[10] = xor_subtract_u32(input[14], 18, 0x00A8C733);
    output[11] = xor_subtract_u32(input[15], 42, 0x00A8C739);
    output[14] = xor_subtract_u32(input[16], 21, 0x00A8C734);
    output[15] = xor_subtract_u32(input[17], 49, 0x00A8C73B);
    output[18] = xor_subtract_u32(input[18], 24, 0x00A8C735);
    output[19] = xor_subtract_u32(input[19], 56, 0x00A8C73D);
    output[22] = xor_subtract_u32(input[20], 27, 0x00A8C736);
    output[23] = xor_subtract_u32(input[21], 63, 0x00A8C73F);
    output[2] = xor_subtract_u32(input[22], 30, 0x00A8C737);
    output[3] = xor_subtract_u32(input[23], 70, 0x00A8C741);
    output[48] = xor_subtract_u32(input[24], 33, 0x00A8C738);
    output[49] = xor_subtract_u32(input[25], 77, 0x00A8C743);
    output[46] = xor_subtract_u32(input[26], 36, 0x00A8C739);
    output[47] = xor_subtract_u32(input[27], 84, 0x00A8C745);
    output[44] = xor_subtract_u32(input[28], 39, 0x00A8C73A);
    output[45] = xor_subtract_u32(input[29], 91, 0x00A8C747);
    output[42] = xor_subtract_u32(input[30], 42, 0x00A8C73B);
    output[43] = xor_subtract_u32(input[31], 98, 0x00A8C749);
    output[24] = xor_subtract_u32(input[32], 45, 0x00A8C73C);
    output[25] = xor_subtract_u32(input[33], 105, 0x00A8C74B);
    output[28] = xor_subtract_u32(input[34], 48, 0x00A8C73D);
    output[29] = xor_subtract_u32(input[35], 112, 0x00A8C74D);
    output[32] = xor_subtract_u32(input[36], 51, 0x00A8C73E);
    output[33] = xor_subtract_u32(input[37], 119, 0x00A8C74F);
    output[36] = xor_subtract_u32(input[38], 54, 0x00A8C73F);
    output[37] = xor_subtract_u32(input[39], 126, 0x00A8C751);
    output[40] = xor_subtract_u32(input[40], 57, 0x00A8C740);
    output[41] = xor_subtract_u32(input[41], 133, 0x00A8C753);
    output[26] = xor_subtract_u32(input[42], 60, 0x00A8C741);
    output[27] = xor_subtract_u32(input[43], 140, 0x00A8C755);
    output[30] = xor_subtract_u32(input[44], 63, 0x00A8C742);
    output[31] = xor_subtract_u32(input[45], 147, 0x00A8C757);
    output[34] = xor_subtract_u32(input[46], 66, 0x00A8C743);
    output[35] = xor_subtract_u32(input[47], 154, 0x00A8C759);
    output[38] = xor_subtract_u32(input[48], 69, 0x00A8C744);
    output[39] = xor_subtract_u32(input[49], 161, 0x00A8C75B);

    memcpy(header, output, sizeof(output));
    header[0] = 0xFAB11BAF;
    return true;
}

bool parse_macho(const file_buffer_t *buf, section_list_t *exec_secs, section_list_t *data_secs, uint64_t *out_image_base) {
    if (!buf || !buf->data || buf->size < sizeof(mach_header_64_t)) {
        return false;
    }
    const mach_header_64_t *mh = (const mach_header_64_t *)buf->data;
    if (mh->magic != 0xFEEDFACF) {
        return false;
    }
    if (mh->sizeofcmds > buf->size - sizeof(mach_header_64_t)) {
        return false;
    }
    uint64_t image_base = UINT64_MAX;
    const uint8_t *p = buf->data + sizeof(mach_header_64_t);
    const uint8_t *end = p + mh->sizeofcmds;
    const uint8_t *file_end = buf->data + buf->size;
    for (uint32_t i = 0; i < mh->ncmds && p + sizeof(load_command_t) <= end; i++) {
        const load_command_t *lc = (const load_command_t *)p;
        if (p + lc->cmdsize > file_end || lc->cmdsize < sizeof(load_command_t)) {
            return false;
        }
        if (lc->cmd == 0x19 && lc->cmdsize >= sizeof(segment_command_64_t)) {
            if (p + sizeof(segment_command_64_t) > file_end) {
                return false;
            }
            const segment_command_64_t *seg = (const segment_command_64_t *)p;
            if (seg->filesize > 0 && seg->fileoff + seg->filesize <= buf->size) {
                search_section_t s = {
                    .offset = seg->fileoff,
                    .offsetEnd = seg->fileoff + seg->filesize,
                    .address = seg->vmaddr,
                    .addressEnd = seg->vmaddr + seg->vmsize
                };
                if (seg->initprot & 0x4) {
                    sec_push(exec_secs, s);
                } else {
                    sec_push(data_secs, s);
                }
                if (seg->vmaddr < image_base) {
                    image_base = seg->vmaddr;
                }
            }
        }
        p += lc->cmdsize ? lc->cmdsize : sizeof(load_command_t);
    }
    if (out_image_base) {
        *out_image_base = (image_base == UINT64_MAX) ? 0 : image_base;
    }
    return exec_secs->count > 0 && data_secs->count > 0;
}

bool va_to_off(const section_list_t *secs, uint64_t va, uint64_t *out_off) {
    for (size_t i = 0; i < secs->count; i++) {
        const search_section_t *s = &secs->items[i];
        if (va >= s->address && va < s->addressEnd) {
            uint64_t delta = va - s->address;
            uint64_t off = s->offset + delta;
            if (off < s->offsetEnd) {
                *out_off = off;
                return true;
            }
        }
    }
    return false;
}

bool va_to_off_any(const section_list_t *data_secs, const section_list_t *exec_secs, uint64_t va, uint64_t *out_off) {
    if (va_to_off(data_secs, va, out_off)) {
        return true;
    }
    if (va_to_off(exec_secs, va, out_off)) {
        return true;
    }
    return false;
}

bool off_to_va(const section_list_t *secs, uint64_t off, uint64_t *out_va) {
    for (size_t i = 0; i < secs->count; i++) {
        const search_section_t *s = &secs->items[i];
        if (off >= s->offset && off < s->offsetEnd) {
            uint64_t delta = off - s->offset;
            *out_va = s->address + delta;
            return true;
        }
    }
    return false;
}

bool va_in(const section_list_t *secs, uint64_t va) {
    for (size_t i = 0; i < secs->count; i++) {
        const search_section_t *s = &secs->items[i];
        if (va >= s->address && va < s->addressEnd) {
            return true;
        }
    }
    return false;
}

bool find_bytes(const uint8_t *data, size_t data_len, const uint8_t *pat, size_t pat_len, size_t *out_pos) {
    if (!data || !pat || pat_len == 0 || data_len < pat_len) {
        return false;
    }
    for (size_t i = 0; i + pat_len <= data_len; i++) {
        if (memcmp(data + i, pat, pat_len) == 0) {
            *out_pos = i;
            return true;
        }
    }
    return false;
}

size_t find_refs(const file_buffer_t *buf, const section_list_t *data_secs, uint64_t target_va, uint64_t *out_refs, size_t max_refs) {
    size_t count = 0;
    for (size_t i = 0; i < data_secs->count; i++) {
        const search_section_t *s = &data_secs->items[i];
        if (s->offsetEnd > buf->size) {
            continue;
        }
        for (uint64_t off = s->offset; off + sizeof(uint64_t) <= s->offsetEnd; off += sizeof(uint64_t)) {
            uint64_t v = *(const uint64_t *)(buf->data + off);
            if (v == target_va) {
                uint64_t va = s->address + (off - s->offset);
                if (count < max_refs) {
                    out_refs[count++] = va;
                }
            }
        }
    }
    return count;
}

bool find_code_reg(const file_buffer_t *unity_buf,
                            const section_list_t *exec_secs,
                            const section_list_t *data_secs,
                            int imageCount,
                            uint64_t *out_code_reg_va) {
    const uint8_t featureBytes[] = {
        0x6D, 0x73, 0x63, 0x6F, 0x72, 0x6C, 0x69, 0x62,
        0x2E, 0x64, 0x6C, 0x6C, 0x00
    };

    size_t pos = 0;
    size_t max_refs = 4096;
    uint64_t refs1[4096];
    uint64_t refs2[4096];
    uint64_t refs3[4096];

    while (pos < unity_buf->size) {
        size_t rel = 0;
        if (!find_bytes(unity_buf->data + pos, unity_buf->size - pos, featureBytes, sizeof(featureBytes), &rel)) {
            break;
        }
        pos += rel;
        uint64_t dll_va = 0;
        if (!off_to_va(exec_secs, pos, &dll_va) && !off_to_va(data_secs, pos, &dll_va)) {
            pos += 1;
            continue;
        }
        size_t ref1_count = find_refs(unity_buf, data_secs, dll_va, refs1, max_refs);
        for (size_t i = 0; i < ref1_count; i++) {
            size_t ref2_count = find_refs(unity_buf, data_secs, refs1[i], refs2, max_refs);
            for (size_t j = 0; j < ref2_count; j++) {
                for (int k = imageCount - 1; k >= 0; k--) {
                    uint64_t needle = refs2[j] - (uint64_t)k * sizeof(uint64_t);
                    size_t ref3_count = find_refs(unity_buf, data_secs, needle, refs3, max_refs);
                    for (size_t n = 0; n < ref3_count; n++) {
                        uint64_t check_va = refs3[n] - sizeof(uint64_t);
                        uint64_t check_off = 0;
                        if (!va_to_off(data_secs, check_va, &check_off)) {
                            continue;
                        }
                        if (check_off + sizeof(uint64_t) > unity_buf->size) {
                            continue;
                        }
                        int64_t val = *(const int64_t *)(unity_buf->data + check_off);
                        if (val == imageCount) {
                            *out_code_reg_va = refs3[n] - (uint64_t)sizeof(uint64_t) * 14;
                            return true;
                        }
                    }
                }
            }
        }
        pos += 1;
    }
    return false;
}

bool find_meta_reg(const file_buffer_t *unity_buf,
                                const section_list_t *exec_secs,
                                const section_list_t *data_secs,
                                int typeDefinitionsCount,
                                uint64_t *out_meta_reg_va) {
    uint64_t ptr_size = sizeof(uint64_t);
    for (size_t si = 0; si < data_secs->count; si++) {
        const search_section_t *s = &data_secs->items[si];
        uint64_t end = s->offsetEnd;
        if (end < s->offset + ptr_size * 4) {
            continue;
        }
        for (uint64_t off = s->offset; off + ptr_size * 4 <= end; off += ptr_size) {
            int64_t v1 = *(const int64_t *)(unity_buf->data + off);
            if (v1 != (int64_t)typeDefinitionsCount) {
                continue;
            }
            int64_t v2 = *(const int64_t *)(unity_buf->data + off + ptr_size * 2);
            if (v2 != (int64_t)typeDefinitionsCount) {
                continue;
            }
            uint64_t ptrs_va = *(const uint64_t *)(unity_buf->data + off + ptr_size * 3);
            uint64_t ptrs_off = 0;
            if (!va_to_off_any(data_secs, exec_secs, ptrs_va, &ptrs_off)) {
                continue;
            }
            uint64_t need = (uint64_t)typeDefinitionsCount * sizeof(uint64_t);
            if (ptrs_off + need > unity_buf->size) {
                continue;
            }
            bool ok = true;
            for (int i = 0; i < typeDefinitionsCount; i++) {
                uint64_t v = *(const uint64_t *)(unity_buf->data + ptrs_off + (uint64_t)i * sizeof(uint64_t));
                if (!va_in(data_secs, v) && !va_in(exec_secs, v)) {
                    ok = false;
                    break;
                }
            }
            if (!ok) {
                continue;
            }
            uint64_t addr_va = s->address + (off - s->offset);
            *out_meta_reg_va = addr_va - ptr_size * 10;
            return true;
        }
    }
    return false;
}

const char *metadata_string(const file_buffer_t *meta, const uint32_t *hdr, uint32_t index) {
    if (!meta || !hdr) {
        return NULL;
    }
    uint32_t stringOffset = hdr[6];
    uint32_t stringSize = hdr[7];
    if (index >= stringSize) {
        return NULL;
    }
    uint32_t str_off = stringOffset + index;
    if (str_off >= (uint32_t)meta->size) {
        return NULL;
    }
    return (const char *)(meta->data + str_off);
}
bool find_method_tok(const file_buffer_t *meta,
                       const uint32_t *hdr,
                       const char *image_name,
                       const char *type_namespace,
                       const char *type_name,
                       const char *method_name,
                       int argsCount, // Thêm tham số argsCount
                       uint32_t *out_method_token) {
    if (!meta || !hdr || !image_name || !type_name || !method_name || !out_method_token) {
        return false;
    }
    uint32_t imagesOffset = hdr[42];
    uint32_t imagesSize = hdr[43];
    uint32_t typeDefinitionsOffset = hdr[40];
    uint32_t typeDefinitionsSize = hdr[41];
    uint32_t methodsOffset = hdr[12];
    uint32_t methodsSize = hdr[13];

    const Il2CppImageDefinition *images = (const Il2CppImageDefinition *)(meta->data + imagesOffset);
    int image_count = imagesSize / (int)sizeof(Il2CppImageDefinition);
    const Il2CppTypeDefinition *types = (const Il2CppTypeDefinition *)(meta->data + typeDefinitionsOffset);
    int type_total = typeDefinitionsSize / (int)sizeof(Il2CppTypeDefinition);
    const Il2CppMethodDefinition *methods = (const Il2CppMethodDefinition *)(meta->data + methodsOffset);
    int method_total = methodsSize / (int)sizeof(Il2CppMethodDefinition);

    for (int i = 0; i < image_count; i++) {
        const char *img_name = metadata_string(meta, hdr, images[i].nameIndex);
        if (!img_name || strcmp(img_name, image_name) != 0) {
            continue;
        }
        int type_start = images[i].typeStart;
        int type_end = type_start + (int)images[i].typeCount;
        
        for (int t = type_start; t < type_end; t++) {
            const char *ns = metadata_string(meta, hdr, types[t].namespaceIndex);
            const char *tn = metadata_string(meta, hdr, types[t].nameIndex);
            if (!tn) continue;

            if (type_namespace) {
                if (!ns || strcmp(ns, type_namespace) != 0) continue;
            } else {
                if (ns && ns[0] != '\0') continue; // Kiểm tra namespace rỗng
            }

            if (strcmp(tn, type_name) != 0) continue;

            int m_start = types[t].methodStart;
            int m_end = m_start + (int)types[t].method_count;
            
            for (int m = m_start; m < m_end; m++) {
                const char *mn = metadata_string(meta, hdr, methods[m].nameIndex);
                // Kiểm tra đồng thời Tên hàm và Số lượng tham số (argsCount)
                if (mn && strcmp(mn, method_name) == 0 && methods[m].parameterCount == argsCount) {
                    *out_method_token = methods[m].token;
                    return true;
                }
            }
        }
    }
    return false;
}

bool find_field_idx(const file_buffer_t *meta,
                      const uint32_t *hdr,
                      const char *image_name,
                      const char *type_namespace,
                      const char *type_name,
                      const char *field_name,
                      int *out_type_index,
                      int *out_field_index_in_type,
                      bool *out_is_value_type) {
    if (!meta || !hdr || !image_name || !type_name || !field_name) {
        return false;
    }
    uint32_t imagesOffset = hdr[42];
    uint32_t imagesSize = hdr[43];
    uint32_t typeDefinitionsOffset = hdr[40];
    uint32_t typeDefinitionsSize = hdr[41];
    uint32_t fieldsOffset = hdr[24];
    uint32_t fieldsSize = hdr[25];

    const Il2CppImageDefinition *images = (const Il2CppImageDefinition *)(meta->data + imagesOffset);
    int image_count = imagesSize / (int)sizeof(Il2CppImageDefinition);
    const Il2CppTypeDefinition *types = (const Il2CppTypeDefinition *)(meta->data + typeDefinitionsOffset);
    int type_total = typeDefinitionsSize / (int)sizeof(Il2CppTypeDefinition);
    const Il2CppFieldDefinition *fields = (const Il2CppFieldDefinition *)(meta->data + fieldsOffset);
    int field_total = fieldsSize / (int)sizeof(Il2CppFieldDefinition);

    for (int i = 0; i < image_count; i++) {
        const char *img_name = metadata_string(meta, hdr, images[i].nameIndex);
        if (!img_name || strcmp(img_name, image_name) != 0) {
            continue;
        }
        int type_start = images[i].typeStart;
        int type_end = type_start + (int)images[i].typeCount;
        if (type_start < 0 || type_start >= type_total) {
            continue;
        }
        if (type_end > type_total) {
            type_end = type_total;
        }
        for (int t = type_start; t < type_end; t++) {
            const char *ns = metadata_string(meta, hdr, types[t].namespaceIndex);
            const char *tn = metadata_string(meta, hdr, types[t].nameIndex);
            if (!tn) {
                continue;
            }
            if (type_namespace) {
                if (!ns || strcmp(ns, type_namespace) != 0) {
                    continue;
                }
            }
            if (strcmp(tn, type_name) != 0) {
                continue;
            }
            int f_start = types[t].fieldStart;
            int f_end = f_start + (int)types[t].field_count;
            if (f_start < 0 || f_start >= field_total) {
                continue;
            }
            if (f_end > field_total) {
                f_end = field_total;
            }
            for (int f = f_start; f < f_end; f++) {
                const char *fn = metadata_string(meta, hdr, fields[f].nameIndex);
                if (fn && strcmp(fn, field_name) == 0) {
                    if (out_type_index) {
                        *out_type_index = t;
                    }
                    if (out_field_index_in_type) {
                        *out_field_index_in_type = f - f_start;
                    }
                    if (out_is_value_type) {
                        *out_is_value_type = (types[t].bitfield & 0x1) != 0;
                    }
                    return true;
                }
            }
        }
    }
    return false;
}

bool get_method_ptr(const file_buffer_t *unity_buf,
                                         const section_list_t *data_secs,
                                         const section_list_t *exec_secs,
                                         uint64_t code_reg_va,
                                         const char *image_name,
                                         uint32_t method_token,
                                         uint64_t *out_method_va) {
    uint64_t code_reg_off = 0;
    if (!va_to_off_any(data_secs, exec_secs, code_reg_va, &code_reg_off)) {
        return false;
    }
    if (code_reg_off + sizeof(Il2CppCodeRegistration) > unity_buf->size) {
        return false;
    }
    const Il2CppCodeRegistration *code_reg = (const Il2CppCodeRegistration *)(unity_buf->data + code_reg_off);
    if (code_reg->codeGenModulesCount == 0 || code_reg->codeGenModules == 0) {
        return false;
    }

    uint64_t modules_off = 0;
    if (!va_to_off_any(data_secs, exec_secs, code_reg->codeGenModules, &modules_off)) {
        return false;
    }
    size_t count = (size_t)code_reg->codeGenModulesCount;
    if (modules_off + count * sizeof(uint64_t) > unity_buf->size) {
        return false;
    }

    uint32_t method_index = method_token & 0x00FFFFFFu;
    if (method_index == 0) {
        return false;
    }

    for (size_t i = 0; i < count; i++) {
        uint64_t module_va = *(const uint64_t *)(unity_buf->data + modules_off + i * sizeof(uint64_t));
        uint64_t module_off = 0;
        if (!va_to_off_any(data_secs, exec_secs, module_va, &module_off)) {
            continue;
        }
        if (module_off + sizeof(Il2CppCodeGenModule) > unity_buf->size) {
            continue;
        }
        const Il2CppCodeGenModule *module = (const Il2CppCodeGenModule *)(unity_buf->data + module_off);
        if (module->moduleName == 0 || module->methodPointers == 0 || module->methodPointerCount <= 0) {
            continue;
        }
        uint64_t name_off = 0;
        if (!va_to_off_any(data_secs, exec_secs, module->moduleName, &name_off)) {
            continue;
        }
        if (name_off >= unity_buf->size) {
            continue;
        }
        const char *mod_name = (const char *)(unity_buf->data + name_off);
        if (!mod_name || strcmp(mod_name, image_name) != 0) {
            continue;
        }

        if ((uint64_t)method_index > (uint64_t)module->methodPointerCount) {
            return false;
        }
        uint64_t ptrs_off = 0;
        if (!va_to_off_any(data_secs, exec_secs, module->methodPointers, &ptrs_off)) {
            return false;
        }
        size_t ptrs_size = (size_t)module->methodPointerCount * sizeof(uint64_t);
        if (ptrs_off + ptrs_size > unity_buf->size) {
            return false;
        }
        *out_method_va = *(const uint64_t *)(unity_buf->data + ptrs_off + (method_index - 1) * sizeof(uint64_t));
        return true;
    }
    return false;
}

bool get_field_off(const file_buffer_t *unity_buf,
                       const section_list_t *data_secs,
                       const section_list_t *exec_secs,
                       uint64_t metadata_reg_va,
                       int typeIndex,
                       int fieldIndexInType,
                       bool isValueType,
                       int *out_offset) {
    uint64_t meta_off = 0;
    if (!va_to_off_any(data_secs, exec_secs, metadata_reg_va, &meta_off)) {
        return false;
    }
    if (meta_off + sizeof(Il2CppMetadataRegistration) > unity_buf->size) {
        return false;
    }
    const Il2CppMetadataRegistration *meta_reg =
        (const Il2CppMetadataRegistration *)(unity_buf->data + meta_off);
    if (meta_reg->fieldOffsetsCount <= 0 || meta_reg->fieldOffsets == 0) {
        return false;
    }
    if (typeIndex < 0 || typeIndex >= meta_reg->fieldOffsetsCount) {
        return false;
    }
    uint64_t field_ptrs_off = 0;
    if (!va_to_off_any(data_secs, exec_secs, meta_reg->fieldOffsets, &field_ptrs_off)) {
        return false;
    }
    uint64_t need = (uint64_t)meta_reg->fieldOffsetsCount * sizeof(uint64_t);
    if (field_ptrs_off + need > unity_buf->size) {
        return false;
    }
    uint64_t per_type_va = *(const uint64_t *)(unity_buf->data + field_ptrs_off + (uint64_t)typeIndex * sizeof(uint64_t));
    if (per_type_va == 0) {
        return false;
    }
    uint64_t per_type_off = 0;
    if (!va_to_off_any(data_secs, exec_secs, per_type_va, &per_type_off)) {
        return false;
    }
    uint64_t field_need = (uint64_t)(fieldIndexInType + 1) * sizeof(int32_t);
    if (per_type_off + field_need > unity_buf->size) {
        return false;
    }
    int32_t offset = *(const int32_t *)(unity_buf->data + per_type_off + (uint64_t)fieldIndexInType * sizeof(int32_t));
    if (offset > 0 && isValueType) {
        offset -= 16;
    }
    if (out_offset) {
        *out_offset = offset;
    }
    return true;
}

char *get_unity_path() {
    @autoreleasepool {
        NSString *frameworkPath = [[NSBundle mainBundle] pathForResource:@"UnityFramework"
                                                                  ofType:nil
                                                             inDirectory:@"Frameworks/UnityFramework.framework"];
        if (frameworkPath.length > 0) {
            return strdup(frameworkPath.UTF8String);
        }
        NSString *exePath = [[NSBundle mainBundle] executablePath];
        if (exePath.length > 0) {
            return strdup(exePath.UTF8String);
        }
        return NULL;
    }
}

char *get_meta_path() {
    @autoreleasepool {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"global-metadata"
                                                         ofType:@"dat"
                                                    inDirectory:@"Data/Managed/Metadata"];
        if (!path.length) {
            return NULL;
        }
        return strdup(path.UTF8String);
    }
}

bool init_cache(unity_cache_t *cache) {
    if (!cache) {
        return false;
    }
    memset(cache, 0, sizeof(*cache));
    char *unity_path = get_unity_path();
    char *meta_path = get_meta_path();
    if (!unity_path || !meta_path) {
        free(unity_path);
        free(meta_path);
        return false;
    }

    if (!read_file(unity_path, &cache->unity) || !read_file(meta_path, &cache->meta)) {
        free(unity_path);
        free(meta_path);
        return false;
    }
    free(unity_path);
    free(meta_path);

    if (!parse_macho(&cache->unity, &cache->exec_secs, &cache->data_secs, &cache->image_base)) {
        return false;
    }

    deobf_meta(&cache->meta);
    if (cache->meta.size < 0x100) {
        return false;
    }
    cache->hdr = (const uint32_t *)cache->meta.data;
    if (cache->hdr[0] != 0xFAB11BAF || cache->hdr[1] < 29) {
        return false;
    }
    if ((uint64_t)cache->hdr[42] + (uint64_t)cache->hdr[43] > cache->meta.size ||
        (uint64_t)cache->hdr[40] + (uint64_t)cache->hdr[41] > cache->meta.size ||
        (uint64_t)cache->hdr[12] + (uint64_t)cache->hdr[13] > cache->meta.size ||
        (uint64_t)cache->hdr[24] + (uint64_t)cache->hdr[25] > cache->meta.size ||
        (uint64_t)cache->hdr[6] + (uint64_t)cache->hdr[7] > cache->meta.size) {
        return false;
    }

    int imageCount = cache->hdr[43] / (int)sizeof(Il2CppImageDefinition);
    if (!find_code_reg(&cache->unity, &cache->exec_secs, &cache->data_secs, imageCount, &cache->code_reg_va)) {
        return false;
    }
    int typeDefinitionsCount = cache->hdr[41] / (int)sizeof(Il2CppTypeDefinition);
    if (!find_meta_reg(&cache->unity, &cache->exec_secs, &cache->data_secs, typeDefinitionsCount, &cache->meta_reg_va)) {
        return false;
    }

    return true;
}

void free_cache(unity_cache_t *cache) {
    if (!cache) {
        return;
    }
    sec_free(&cache->exec_secs);
    sec_free(&cache->data_secs);
    free_file(&cache->unity);
    free_file(&cache->meta);
    memset(cache, 0, sizeof(*cache));
} 
uint64_t FindMethodOffset(const char *image_name, 
                          const char *type_namespace, 
                          const char *type_name, 
                          const char *method_name, 
                          int argsCount) { // Thêm tham số argsCount
    unity_cache_t cache;
    if (!init_cache(&cache)) {
        return 0;
    }

    uint32_t method_token = 0;
    // Tìm Token dựa trên tên và số lượng tham số
    if (!find_method_tok(&cache.meta, cache.hdr, image_name, type_namespace, type_name, method_name, argsCount, &method_token)) {
        free_cache(&cache);
        return 0;
    }

    uint64_t method_va = 0;
    // Ánh xạ Token sang địa chỉ thực thi (VA) trong file UnityFramework
    if (!get_method_ptr(&cache.unity, &cache.data_secs, &cache.exec_secs,
                        cache.code_reg_va, image_name, method_token, &method_va)) {
        free_cache(&cache);
        return 0;
    }

    uint64_t result = method_va;
    // Chuyển đổi địa chỉ tuyệt đối (VA) sang địa chỉ tương đối (Offset)
    if (cache.image_base > 0 && method_va > 0) {
        result = method_va - cache.image_base;
    }

    free_cache(&cache);
    return result;
}

int FindFieldOffset(const char *image_name,
                    const char *type_namespace,
                    const char *type_name,
                    const char *field_name) {
    unity_cache_t cache;
    if (!init_cache(&cache)) {
        return 0;
    }
    int type_index = -1;
    int field_index_in_type = -1;
    bool is_value_type = false;
    if (!find_field_idx(&cache.meta, cache.hdr, image_name, type_namespace, type_name,
                          field_name, &type_index, &field_index_in_type, &is_value_type)) {
        free_cache(&cache);
        return 0;
    }
    int offset = 0;
    if (!get_field_off(&cache.unity, &cache.data_secs, &cache.exec_secs,
                           cache.meta_reg_va, type_index, field_index_in_type, is_value_type, &offset)) {
        free_cache(&cache);
        return 0;
    }
    free_cache(&cache);
    return offset;
}
// Biến toàn cục để giữ cache đã giải mã trong RAM
    extern unity_cache_t global_cache; 
    extern bool is_metadata_initialized;

    // Hàm khởi tạo một lần duy nhất khi load dylib
    bool InitializeSystem() {
        if (is_metadata_initialized) return true;
        
        if (init_cache(&global_cache)) {
            is_metadata_initialized = true;
            return true;
        }
        return false;
    }

    // Hàm giải phóng khi thoát game (nếu cần)
    void ShutdownSystem() {
        if (is_metadata_initialized) {
            free_cache(&global_cache);
            is_metadata_initialized = false;
        }
    }
    file_buffer_t GetDecodedBuffer() {
            unity_cache_t temp_cache;
            if (init_cache(&temp_cache)) {
                // init_cache đã gọi deobf_meta bên trong
                return temp_cache.meta; 
            }
            return {nullptr, 0, false};
        }
} 
class IL2CPP_Bridge {
public:
    static uintptr_t NewGetMethod(const char* img, const char* ns, const char* clz, const char* mth, int args) {
        if (!Metadata::is_metadata_initialized) Metadata::InitializeSystem();

        uint32_t token = 0;
        // Sử dụng global_cache thay vì khởi tạo mới bên trong FindMethodOffset
        if (Metadata::find_method_tok(&Metadata::global_cache.meta, Metadata::global_cache.hdr, img, ns, clz, mth, args, &token)) {
            uint64_t method_va = 0;
            if (Metadata::get_method_ptr(&Metadata::global_cache.unity, &Metadata::global_cache.data_secs, &Metadata::global_cache.exec_secs,
                                        Metadata::global_cache.code_reg_va, img, token, &method_va)) {
                return (uintptr_t)(method_va - Metadata::global_cache.image_base);
            }
        }
        return 0;
    }

    // Tìm Offset của một Field
    static int GetFieldOffset(const char* img, const char* ns, const char* clz, const char* fld) {
        if (!Metadata::is_metadata_initialized) Metadata::InitializeSystem();

        int type_idx = -1, field_idx = -1;
        bool is_val = false;
        if (Metadata::find_field_idx(&Metadata::global_cache.meta, Metadata::global_cache.hdr, img, ns, clz, fld, &type_idx, &field_idx, &is_val)) {
            int offset = 0;
            if (Metadata::get_field_off(&Metadata::global_cache.unity, &Metadata::global_cache.data_secs, &Metadata::global_cache.exec_secs,
                                       Metadata::global_cache.meta_reg_va, type_idx, field_idx, is_val, &offset)) {
                return offset;
            }
        }
        return 0;
    }
};
namespace Metadata {
    unity_cache_t global_cache; 
    bool is_metadata_initialized = false;
}