
#include "Includes.h"
#import "KittyMemory/Icon.h"
#import "KittyMemory/bdvt.h"
#include "KittyMemory/imgui_demo.h"
#import "MenuLoad/NakanoYotsuba.h"
#import "MenuLoad/Other/khaibao.h"
#import "MenuLoad/deobf.h"
#import "MenuLoad/lib.h"
#import "MenuLoad/main.h"
#include "NSLOGC.h"
#import "Other/Function.h"
#include "Other/Quaternion.h"
#import "mahoa.h"

#define Sk_SlotType ENCRYPTOFFSET("0x80")
#define Sk_skillIndicator ENCRYPTOFFSET("0xb8")
#define Sk_curindicatorDistance ENCRYPTOFFSET("0x170")
#define Sk_useSkillDirection ENCRYPTOFFSET("0x38")
#define Actorlk_ValueComponent ENCRYPTOFFSET("0x28")
#define LActorRoot_location ENCRYPTOFFSET("0xc8")
#define LActorRoot_forward ENCRYPTOFFSET("0xd4")
#define LActorRoot_ActorControl ENCRYPTOFFSET("0x2d8")
#define LActorRoot_ValueComponent ENCRYPTOFFSET("0x308")
#define ActorLinker_ObjLinker ENCRYPTOFFSET("0x118")
#define Aclk_HudControl ENCRYPTOFFSET("0x70")
#define Actorlk_ObjLinker ENCRYPTOFFSET("0x118")
#define ActorConfig_ConfigID ENCRYPTOFFSET("0x1c")
#define UL_ulAccountUid ENCRYPTOFFSET("0x10")

#define UL_PlayerUId ENCRYPTOFFSET("0x18")

#define UL_broadcastID ENCRYPTOFFSET("0xfc")

#define UL_PersonalButtonID ENCRYPTOFFSET("0x104")

#define UL_usingSoldierSkinID ENCRYPTOFFSET("0x128")
#import "Aimbot.h"

#define GET_OFFSET(DLL, NAMESPACE, CLASS, METHOD, PARAMS) (uintptr_t) getRealOffset((uintptr_t)IL2CPP_Bridge::NewGetMethod(DLL, NAMESPACE, CLASS, METHOD, PARAMS))
#define GET_FIELDS(DLL, NAMESPACE, CLASS, FIELD) IL2CPP_Bridge::GetFieldOffset(DLL, NAMESPACE, CLASS, FIELD)
static int i = 0;
double delayhook = 0.15;

void (^enqueue)(void (^)(void)) = ^(void (^block)(void)) {
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayhook * i++ * NSEC_PER_SEC)), dispatch_get_main_queue(), block);
};
#define HookDelay(Offset, Func, Orig) \
  enqueue(^{                          \
    HookUnity(Offset, Func, Orig);    \
  })

#define STB_IMAGE_IMPLEMENTATION
#import "KittyMemory/Il2cpp.h"
#import "il2cpp.h"
using namespace IL2Cpp;
#include "KittyMemory/stb_image.h"
#import "Logo.h"
#import "MenuLoad/Other/icon.h"
#import "MenuLoad/Other/italic.h"
#import "MenuLoad/Other/zzz.h"
#import "Other/IMAGE.h"
#include "Other/stb_image.h"  // Để load ảnh từ buffer
#import "img.h"

namespace Settings {
static int Tab = 1;
}

#include "PatchNonJb/va.h"
// #include "PatchNonJb/nova.h"

@interface ImGuiDrawView () <MTKViewDelegate>
@property(nonatomic, strong) id<MTLDevice> device;
@property(nonatomic, strong) id<MTLCommandQueue> commandQueue;
@property(nonatomic, strong) UILabel *statusLabel;  // Thêm label để hiển thị text
@property(nonatomic, assign) ImFont *italic;
@property(nonatomic, assign) ImFont *icon131;

@end

@implementation ImGuiDrawView
#import "Other/vuthook.h"

void TriggerHapticFeedback() {
  if (@available(iOS 10.0, *)) {
    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
    [generator prepare];
    [generator impactOccurred];
  }
}

// LƯU SETTING
// start menu
static NSString *const kMapStateKey = @"MapState";
static NSString *const kPlayerNameStateKey = @"PlayerNameState";
static NSString *const kSkillCDStateKey = @"SkillCDState";
static NSString *const kShowSkillCDStateKey = @"ShowSkillCDState";

static NSString *const kAntibanStateKey = @"AntibanState";
static NSString *const kAntibanStateKey2 = @"AntibanState2";
static NSString *const kAntibanStateKey3 = @"AntibanState3";
static NSString *const kUIDStateKey = @"UIDState";
static NSString *const kCameraStateKey = @"CameraState";
static NSString *const kDitmeHackerLoActiveKey = @"DitmeHackerLoActive";
static NSString *const kHoaThuActiveKey = @"HoaThuActive";
static NSString *const kANICONStateKey = @"ANICONState";
static NSString *const kFootTextStateKey = @"FootTextState";      // Thêm hằng số cho checkbox "THANH UID"
static NSString *const kFPSDisplayStateKey = @"FPSDisplayState";  // Thêm hằng số cho checkbox "THANH FPS"
static NSString *const kThemeStateKey = @"ThemeStateKey";         // Thêm hằng số cho trạng thái chủ đề
static NSString *const kDroneStateKey = @"DroneState";
static NSString *const kHideLineElsuStateKey = @"HideLineElsuState";
static NSString *const klockcamStateKey = @"lockcamState";
static NSString *const kCustomPlayerNameKey = @"CustomPlayerNameKey";  // Thêm hằng số cho tên người chơi tùy chỉnh
static NSString *const kAntiStateKey = @"AntiState";
static NSString *const kunlockskinStateKey = @"unlockskinState";
static NSString *const kchaptoStateKey = @"chaptoState";
static NSString *const DrawESPState = @"drawespkey";
static NSString *const InfoState = @"infostate";
static NSString *const NumState = @"numstate";
static NSString *const alertState = @"alertstate";
static NSString *const lineState = @"linestate";
static NSString *const boxState = @"boxstate";
static NSString *const disState = @"disstate";
static NSString *const miniState = @"ministate";
static NSString *const iconState = @"iconstate";
static NSString *const kspamchatStateKey = @"spamchatstate";
static NSString *const proState = @"prostate";
static NSString *const noobState = @"noobstate";
static NSString *const maymanhState = @"maymanhsstate";
static NSString *const mayyeuState = @"mayyeusstate";
static NSString *const macdinhState = @"macdinhstate";
static NSString *const kunbanchatStateKey = @"kunbanchatStateKey";
static NSString *const kaimdonStateKey = @"kAimdonStateKey";
static NSString *const kvetiaElsuStateKey = @"kVetiaElsuStateKey";
static NSString *const autottStateKey = @"autotttate";
static NSString *const unlockbutonStateKey = @"unlockbutontate";
static NSString *const unlockhaStateKey = @"unlockhaState";
static NSString *const kMinimapPosXKey = @"MinimapPosXState";
static NSString *const kMinimapPosYKey = @"MinimapPosYState";
static NSString *const kMinimapRotationKey = @"MinimapRotationState";
static NSString *const kMinimapScaleKey = @"MinimapScaleState";
static NSString *const kIconScaleKey = @"IconScaleState";
static NSString *const BLOCKState = @"BLOCKState";
static NSString *const choikinstate = @"choikinstate";
static NSString *const kautologStateKey = @"autologstate";
static NSString *const kmaubotroKey = @"maubotroState";
static NSString *const kmauphutroKey = @"mauphutroState";
static NSString *const kautolog3p2sStateKey = @"kautolog3p2sState";
static NSString *const kblocksettleStateKey = @"kblocksettleState";
static NSString *const kThongbaolandauStateKey = @"kThongbaolandauState";

void saveState(NSString *key, bool state) {
  [[NSUserDefaults standardUserDefaults] setBool:state forKey:key];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

bool loadState(NSString *key) { return [[NSUserDefaults standardUserDefaults] boolForKey:key]; }

void saveStateBool(NSString *key, bool state) {
  [[NSUserDefaults standardUserDefaults] setBool:state forKey:key];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

bool loadStateBool(NSString *key, bool defaultValue = false) {
  if ([[NSUserDefaults standardUserDefaults] objectForKey:key] == nil) {
    return defaultValue;
  }
  return [[NSUserDefaults standardUserDefaults] boolForKey:key];
}

void saveCameraState(float camera) {
  [[NSUserDefaults standardUserDefaults] setFloat:camera forKey:kCameraStateKey];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

float loadCameraState() {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  if ([defaults objectForKey:kCameraStateKey] == nil) {
    return 1.3;  // Giá trị mặc định
  }
  return [defaults floatForKey:kCameraStateKey];
}

void saveDroneState(float drone) {
  [[NSUserDefaults standardUserDefaults] setFloat:drone forKey:kDroneStateKey];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

float loadDroneState() { return [[NSUserDefaults standardUserDefaults] floatForKey:kDroneStateKey]; }

void SaveComboNut() {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

  [defaults setInteger:selectedValue forKey:@"selectedValue"];
  [defaults setInteger:heroid2 forKey:@"heroid2"];
  [defaults setInteger:skinid2 forKey:@"skinid2"];

  [defaults synchronize];
}
// Gọi khi load lại app hoặc cần áp dụng combo
void LoadComboNut() {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

  selectedValue = (int)[defaults integerForKey:@"selectedValue"];
  heroid2 = (int)[defaults integerForKey:@"heroid2"];
  skinid2 = (int)[defaults integerForKey:@"skinid2"];
}

void LoadCachChoiState() {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  choithang = [defaults boolForKey:@"ChoiThangcachchoi"];
  logsongsong = [defaults boolForKey:@"LogSongSongcachchoi"];
  choikin = [defaults boolForKey:@"ChoiKincachchoi"];
  logsongsong3phut = [defaults boolForKey:@"logsongsong3phutcachchoi"];
  logsongsongchapto = [defaults boolForKey:@"logsongsongchaptocachchoi"];
  xoadulieu = [defaults boolForKey:@"xoadulieucachchoi"];

  // Đảm bảo chỉ có 1 option được chọn
  if (!logsongsong && !choikin && !logsongsong3phut && !logsongsongchapto && !xoadulieu) {
    choikin = true;  // Default chọn cái đầu tiên
  }
}

// Hàm để save trạng thái vào NSUserDefaults
void SaveCachChoiState() {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  [defaults setBool:choithang forKey:@"ChoiThangcachchoi"];
  [defaults setBool:logsongsong forKey:@"LogSongSongcachchoi"];
  [defaults setBool:choikin forKey:@"ChoiKincachchoi"];
  [defaults setBool:logsongsong3phut forKey:@"logsongsong3phutcachchoi"];
  [defaults setBool:logsongsongchapto forKey:@"logsongsongchaptocachchoi"];
  [defaults setBool:xoadulieu forKey:@"xoadulieucachchoi"];

  [defaults synchronize];
}

void saveFloatState(NSString *key, float value) {
  [[NSUserDefaults standardUserDefaults] setFloat:value forKey:key];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

float loadFloatState(NSString *key, float defaultValue) {
  if ([[NSUserDefaults standardUserDefaults] objectForKey:key] != nil) {
    return [[NSUserDefaults standardUserDefaults] floatForKey:key];
  }
  return defaultValue;
}

void saveFloatStateForSlider(const char *sliderName, float value) {
  NSString *key = [NSString stringWithFormat:@"%sKey", sliderName];
  [[NSUserDefaults standardUserDefaults] setFloat:value forKey:key];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

static ImVec2 minimapPos = ImVec2(loadFloatState(kMinimapPosXKey, 45.111f), loadFloatState(kMinimapPosYKey, 32.344f));
static float minimapRotation = loadFloatState(kMinimapRotationKey, -0.7f);
static float minimapScale = loadFloatState(kMinimapScaleKey, 1.402f);
static float iconScale = loadFloatState(kIconScaleKey, 1.691f);
static float initialRotation = minimapRotation;  // Lưu lại giá trị gốc của minimapRotation
static int previousMinimapType = minimapType;    // Lưu trạng thái trư ớc đó của minimapType
bool pro = loadStateBool(proState, false);
bool noob = loadStateBool(noobState, true);
bool ESPCount = loadState(NumState);
bool DrawBigDot = loadState(iconState);
bool PlayerDistance = loadState(disState);
bool Alert360 = loadState(alertState);
bool PlayerLine = loadState(lineState);
bool PlayerName = loadState(InfoState);
bool showMinimap = loadState(miniState);
bool Boxx = loadState(boxState);
bool unlockskin = loadState(kunlockskinStateKey);
bool chapto = loadState(kchaptoStateKey);
bool autolog = loadState(kautologStateKey);
bool loop = true;

static bool checklsd1 = true;
static bool checklsd2 = true;
static bool checklsd1_active = false;
static bool checklsd2_active = false;
bool chapto_active;
static bool homeActive = false;
static bool taihoActive = false;
bool spamchat = loadState(kspamchatStateKey);
float camera = loadCameraState();  // Load the initial camera state
float drone = loadDroneState();
bool doiten;
char label[32];
bool choikin;
bool choithang;
bool logsongsong;
bool xoadulieu;
bool logsongsong3phut;
bool choithangcanto;
bool choithangchapto;
bool choithangchaptov2;
bool choithangchaptov3;
bool logsongsongchapto;
bool thongbaolandau = loadStateBool(kThongbaolandauStateKey, true);
bool logsongsongchapto_active;
bool tdktmacdinh = loadStateBool(macdinhState, false);
bool unbanchat = loadState(kunbanchatStateKey);
bool unlockbutton = loadState(unlockbutonStateKey);
bool unlockha = loadState(unlockhaStateKey);
// bool AimSkill = loadState(kaimdonStateKey);
bool vetiaelsu = loadState(kvetiaElsuStateKey);
bool BLOCK = loadState(BLOCKState);
float mauphutro = loadFloatState(kmauphutroKey, 50.0f);  // % máu
float maubotro = loadFloatState(kmaubotroKey, 15.0f);    // % máu
bool autolog3p2s = loadState(kautolog3p2sStateKey);
bool blocksettle = loadState(kblocksettleStateKey);
static bool MapHack = loadState(kMapStateKey);
static int selectedStyleIndex = false;
static bool onehit = false;
static bool nocd = false;
static bool nocd_active = false;
static bool skill0s = false;
static bool hackmap = false;
static bool camxa = false;
static bool hidename = false;
static bool hoichieu = false;
static bool fullskin = false;
static bool balo = false;
static bool uid = loadState(kUIDStateKey);
static bool fullskin_active = false;
static bool balo_active = false;
static bool uid_active = false;
static bool onehit_active = false;
static bool skill0s_active = false;
static bool hidename_active = false;
static bool hackmap_active = false;
static bool xoay_active = false;
static bool ghim_active = false;
static bool hoichieu_active = false;

static bool antiban = loadStateBool(kAntibanStateKey, true);
static bool skillcd = loadState(kSkillCDStateKey);
bool showcd = loadState(kShowSkillCDStateKey);

static bool ANICON = loadState(kANICONStateKey);
static bool map_active = false;
static bool choithangchaptov1_active = false;
static bool choithangchaptov2_active = false;
static bool choithangchaptov3_active = false;

static bool antiban_active = false;
static bool skill_active = false;
ImVec4 maincolor = ImVec4(186 / 255.0f, 60 / 255.0f, 61 / 255.0f, 1.0f);
ImVec4 subcolor = ImVec4(55 / 255.0f, 75 / 255.0f, 170 / 255.0f, 1.0f);
ImVec4 xam = ImVec4(100 / 255.0f, 100 / 255.0f, 100 / 255.0f, 1.0f);
ImVec4 red = ImVec4(255 / 255.0f, 86 / 255.0f, 102 / 255.0f, 1.0f);
ImVec4 redsub = ImVec4(151 / 255.0f, 51 / 255.0f, 61 / 255.0f, 1.0f);

void RenderTabButton(const char *label, ImVec2 size, int tabId) {
  bool isHovered = ImGui::IsItemHovered();
  bool isActive = Settings::Tab == tabId;
  ImVec4 normalTextColor = ImVec4(140 / 255.0f, 140 / 255.0f, 140 / 255.0f, 1.0f);
  ImVec4 activeTextColor = ImVec4(255 / 255.0f, 255 / 255.0f, 255 / 255.0f, 1.0f);
  ImVec4 buttonColor = isActive ? maincolor : ImVec4(40 / 255.0f, 40 / 255.0f, 40 / 255.0f, 1.5f);
  ImVec4 textColor = isActive ? activeTextColor : normalTextColor;

  ImGui::PushStyleColor(ImGuiCol_Button, buttonColor);
  ImGui::PushStyleColor(ImGuiCol_ButtonHovered, buttonColor);
  ImGui::PushStyleColor(ImGuiCol_Text, textColor);
  ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 9.5f);
  ImGui::PushStyleVar(ImGuiStyleVar_FrameBorderSize, 0.0f);
  ImGui::PushStyleColor(ImGuiCol_Border, ImVec4(41 / 255.0f, 160 / 255.0f, 255 / 255.0f, 1.0f));

  if (ImGui::Button(label, size)) {
    Settings::Tab = tabId;
    TriggerHapticFeedback();
  }

  ImGui::PopStyleColor(4);
  ImGui::PopStyleVar(2);
}

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

  _device = MTLCreateSystemDefaultDevice();
  _commandQueue = [_device newCommandQueue];

  if (!self.device) abort();

  IMGUI_CHECKVERSION();
  ImGui::CreateContext();
  ImGuiIO &io = ImGui::GetIO();
  ImFontConfig config;
  static const ImWchar icons_ranges[] = {0xf000, 0xf3ff, 0};
  ImFontConfig icons_config;

  config.FontDataOwnedByAtlas = false;
  icons_config.MergeMode = true;
  icons_config.PixelSnapH = true;

  ImGui::StyleColorsClassic();

  io.Fonts->AddFontFromMemoryCompressedTTF((void *)font_compressed_data, font_compressed_size, 80.0f, NULL, io.Fonts->GetGlyphRangesVietnamese());
  self.italic = io.Fonts->AddFontFromMemoryCompressedTTF((void *)italic_compressed_data, italic_compressed_size, 70.0f, NULL, io.Fonts->GetGlyphRangesVietnamese());
  self.icon131 = io.Fonts->AddFontFromMemoryCompressedTTF((void *)icon_compressed_data, icon_compressed_size, 70.0f, NULL, io.Fonts->GetGlyphRangesVietnamese());

  ImGui_ImplMetal_Init(_device);
  [self initImageTexture:_device];
  return self;
}
void ShowOverlayWindow() {
  ImGuiIO &io = ImGui::GetIO();
  ImDrawList *draw_list = ImGui::GetBackgroundDrawList();

  // Kích thước màn hình
  ImVec2 screen_size = io.DisplaySize;

  // Vẽ nền đen bán trong suốt phủ toàn bộ màn hình
  draw_list->AddRectFilled(ImVec2(0, 0), screen_size, IM_COL32(0, 0, 0, 128)  // alpha = 128 (50%)
  );

  // Tính toán vị trí hình chữ nhật chính giữa
  ImVec2 rect_size = ImVec2(385, 185);
  ImVec2 rect_pos = ImVec2((screen_size.x - rect_size.x) / 2.0f, (screen_size.y - rect_size.y) / 2.0f);

  // Vẽ hình chữ nhật trắng (có thể đổi màu)
  draw_list->AddRectFilled(rect_pos, ImVec2(rect_pos.x + rect_size.x, rect_pos.y + rect_size.y), IM_COL32(255, 255, 255, 255),  // màu trắng đục
                           10.0f                                                                                                // bo góc
  );

  // Bạn có thể thêm ImGui::SetCursorScreenPos(rect_pos) +
  // ImGui::BeginChild(...) để đặt nội dung vào hình chữ nhật
}
struct TabAnimation {
  float alpha;
  std::chrono::steady_clock::time_point startTime;
  bool isAnimating;
  bool hasAnimated;
};

std::unordered_map<int, TabAnimation> tabAnimations;

void UpdateTabAnimation(int tabIndex) {
  auto &anim = tabAnimations[tabIndex];
  if (!anim.hasAnimated) {
    anim.alpha = 0.0f;
    anim.startTime = std::chrono::steady_clock::now();
    anim.isAnimating = true;
    anim.hasAnimated = true;
  }

  if (anim.isAnimating) {
    auto now = std::chrono::steady_clock::now();
    float elapsed = std::chrono::duration<float>(now - anim.startTime).count();
    float duration = 0.45f;  // Animation duration in seconds

    anim.alpha = std::min(elapsed / duration, 1.0f);

    if (anim.alpha >= 1.0f) {
      anim.isAnimating = false;
    }
  }
}

void ResetTabAnimations() {
  for (auto &pair : tabAnimations) {
    pair.second.hasAnimated = false;
  }
}

+ (void)showChange:(BOOL)open {
  MenDeal = open;
}

+ (BOOL)isMenuShowing {
  return MenDeal;
}

- (MTKView *)mtkView {
  return (MTKView *)self.view;
}

- (void)loadView {
  CGFloat w = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width;
  CGFloat h = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height;
  self.view = [[MTKView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
  static dispatch_once_t onceToken;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.mtkView.device = self.device;
  if (!self.mtkView.device) {
    return;
  }
  self.mtkView.delegate = self;
  self.mtkView.clearColor = MTLClearColorMake(0, 0, 0, 0);
  self.mtkView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
  self.mtkView.clipsToBounds = YES;
}

#import "MenuLoad/HookDefine.h"

#pragma mark - Interaction
struct MenuState {
  bool isVisible = false;
  float alpha = 0.0f;
  std::chrono::steady_clock::time_point transitionStart;
  bool isTransitioning = false;
};

MenuState menuState;

struct SelectionState {
  bool isVisible = false;
  float alpha = 0.0f;
  std::chrono::steady_clock::time_point transitionStart;
  bool isTransitioning = false;
};

std::map<int, SelectionState> selectionStates;
int previousSelection = -1;
int currentSelection = 0;

bool DrawAimbotBox(const char *label, const char *description, ImFont *italicFont, ImFont *iconFont, const char *uniqueID) {
  ImDrawList *draw_list = ImGui::GetWindowDrawList();
  ImVec2 pos = ImGui::GetCursorScreenPos();
  ImVec2 size = ImVec2(213.0f, 50.0f);
  ImVec2 end = ImVec2(pos.x + size.x, pos.y + size.y);

  // InvisibleButton bao phủ toàn bộ box để bắt sự kiện click
  ImGui::SetCursorScreenPos(pos);
  bool clicked = ImGui::InvisibleButton(uniqueID, size);

  // Vẽ nền
  draw_list->AddRectFilled(pos, end, IM_COL32(54, 22, 25, 255), 20.0f);

  // Text chính
  ImVec2 text1Pos = ImVec2(pos.x + 19.6f, pos.y + 9.0f);
  ImGui::SetCursorScreenPos(text1Pos);
  ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(255, 255, 255, 255));
  ImGui::SetWindowFontScale(1.9f);
  ImGui::TextUnformatted(label);
  ImGui::PopStyleColor();

  // Text phụ
  ImVec2 text2Pos = ImVec2(text1Pos.x, text1Pos.y + ImGui::GetFontSize() - 3.0f);
  ImGui::SetCursorScreenPos(text2Pos);
  ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(181, 101, 114, 255));
  ImGui::SetWindowFontScale(1.2f);
  ImGui::PushFont(italicFont);
  ImGui::TextUnformatted(description);
  ImGui::PopFont();
  ImGui::PopStyleColor();
  ImGui::SetWindowFontScale(3.5f);
  //   // Text "7" hoặc biểu tượng
  float textHeight = ImGui::GetFontSize();
  float centeredY = pos.y + (size.y - textHeight) / 2.0f;
  ImVec2 text7Pos = ImVec2(pos.x + 173.0f, centeredY - 1.5f);
  ImGui::SetCursorScreenPos(text7Pos);
  ImGui::SetWindowFontScale(3.5f);

  ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(255, 255, 255, 255));
  ImGui::PushFont(iconFont);

  // Dùng InvisibleButton với ID duy nhất
  ImGui::SetCursorScreenPos(text7Pos);
  ImGui::InvisibleButton(uniqueID, ImVec2(30, 30));
  draw_list->AddText(text7Pos, IM_COL32(255, 255, 255, 255), "7");

  ImGui::PopFont();
  ImGui::PopStyleColor();

  return clicked;
}

bool DrawAimbotBoxdaihon(const char *label, const char *description, ImFont *italicFont, ImFont *iconFont, const char *uniqueID) {
  ImDrawList *draw_list = ImGui::GetWindowDrawList();
  ImVec2 pos = ImGui::GetCursorScreenPos();
  ImVec2 size = ImVec2(350.0f, 50.0f);
  ImVec2 end = ImVec2(pos.x + size.x, pos.y + size.y);

  // InvisibleButton bao phủ toàn bộ box để bắt sự kiện click
  ImGui::SetCursorScreenPos(pos);
  bool clicked = ImGui::InvisibleButton(uniqueID, size);

  // Vẽ nền
  draw_list->AddRectFilled(pos, end, IM_COL32(54, 22, 25, 255), 15.0f);

  // Text chính
  ImVec2 text1Pos = ImVec2(pos.x + 19.6f, pos.y + 9.0f);
  ImGui::SetCursorScreenPos(text1Pos);
  ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(255, 255, 255, 255));
  ImGui::SetWindowFontScale(1.9f);
  ImGui::TextUnformatted(label);
  ImGui::PopStyleColor();

  // Text phụ
  ImVec2 text2Pos = ImVec2(text1Pos.x, text1Pos.y + ImGui::GetFontSize() - 3.0f);
  ImGui::SetCursorScreenPos(text2Pos);
  ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(181, 101, 114, 255));
  ImGui::SetWindowFontScale(1.2f);
  ImGui::PushFont(italicFont);
  ImGui::TextUnformatted(description);
  ImGui::PopFont();
  ImGui::PopStyleColor();
  ImGui::SetWindowFontScale(3.9f);
  //   // Text "7" hoặc biểu tượng
  float textHeight = ImGui::GetFontSize();
  float centeredY = pos.y + (size.y - textHeight) / 2.0f;
  ImVec2 text7Pos = ImVec2(pos.x + 300.0f, centeredY - 1.5f);
  ImGui::SetCursorScreenPos(text7Pos);
  ImGui::SetWindowFontScale(3.5f);

  ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(255, 255, 255, 255));
  ImGui::PushFont(iconFont);

  // Dùng InvisibleButton với ID duy nhất
  ImGui::SetCursorScreenPos(text7Pos);
  ImGui::InvisibleButton(uniqueID, ImVec2(30, 30));
  draw_list->AddText(text7Pos, IM_COL32(255, 255, 255, 255), "7");

  ImGui::PopFont();
  ImGui::PopStyleColor();

  return clicked;
}

bool DrawToggleBox(const char *label, const char *description, const char *uniqueID, bool isActive, ImFont *italicFont, ImFont *iconFont) {
  ImDrawList *draw_list = ImGui::GetWindowDrawList();
  ImVec2 pos = ImGui::GetCursorScreenPos();
  ImVec2 size = ImVec2(150.0f, 50.0f);
  ImVec2 end = ImVec2(pos.x + size.x, pos.y + size.y);

  // InvisibleButton bao phủ toàn bộ box để bắt sự kiện click
  ImGui::SetCursorScreenPos(pos);
  bool clicked = ImGui::InvisibleButton(uniqueID, size);

  // Nền tùy theo trạng thái bật/tắt
  ImU32 boxColor = isActive ? IM_COL32(255, 86, 102, 255) : IM_COL32(54, 22, 25, 255);
  draw_list->AddRectFilled(pos, end, boxColor, 15.0f);

  // Text chính
  ImVec2 text1Pos = ImVec2(pos.x + 15.5f, pos.y + 8.0f);
  ImGui::SetCursorScreenPos(text1Pos);
  ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(255, 255, 255, 255));
  ImGui::SetWindowFontScale(1.7f);
  ImGui::TextUnformatted(label);
  ImGui::PopStyleColor();

  // Text phụ
  if (isActive) {
    ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(104, 37, 35, 255));
  } else {
    ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(181, 101, 114, 255));
  }
  ImVec2 text2Pos = ImVec2(text1Pos.x, text1Pos.y + ImGui::GetFontSize() - 2.0f);
  ImGui::SetCursorScreenPos(text2Pos);
  ImGui::SetWindowFontScale(1.1f);
  ImGui::PushFont(italicFont);
  ImGui::TextUnformatted(description);
  ImGui::PopFont();
  ImGui::PopStyleColor();

  // Icon hoặc ký tự đặc biệt (nếu cần)
  float textHeight = ImGui::GetFontSize();
  float centeredY = pos.y + (size.y - textHeight) / 2.0f;
  ImVec2 iconPos = ImVec2(pos.x + size.x - 40.0f, centeredY - 18.0f);
  ImGui::SetCursorScreenPos(iconPos);
  ImGui::SetWindowFontScale(3.6f);
  ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(255, 255, 255, 255));
  ImGui::PushFont(iconFont);
  draw_list->AddText(iconPos, IM_COL32(255, 255, 255, 255), "7");
  ImGui::PopFont();
  ImGui::PopStyleColor();

  return clicked;
}

bool DrawToggleBoxdaihon2(const char *label, const char *description, const char *uniqueID, bool isActive, ImFont *italicFont, ImFont *iconFont) {
  ImDrawList *draw_list = ImGui::GetWindowDrawList();
  ImVec2 pos = ImGui::GetCursorScreenPos();
  ImVec2 size = ImVec2(190.0f, 50.0f);
  ImVec2 end = ImVec2(pos.x + size.x, pos.y + size.y);

  // InvisibleButton bao phủ toàn bộ box để bắt sự kiện click
  ImGui::SetCursorScreenPos(pos);
  bool clicked = ImGui::InvisibleButton(uniqueID, size);

  // Nền tùy theo trạng thái bật/tắt
  ImU32 boxColor = isActive ? IM_COL32(255, 86, 102, 255) : IM_COL32(54, 22, 25, 255);
  draw_list->AddRectFilled(pos, end, boxColor, 15.0f);

  // Text chính
  ImVec2 text1Pos = ImVec2(pos.x + 15.5f, pos.y + 8.0f);
  ImGui::SetCursorScreenPos(text1Pos);
  ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(255, 255, 255, 255));
  ImGui::SetWindowFontScale(1.7f);
  ImGui::TextUnformatted(label);
  ImGui::PopStyleColor();

  // Text phụ
  if (isActive) {
    ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(104, 37, 35, 255));
  } else {
    ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(181, 101, 114, 255));
  }
  ImVec2 text2Pos = ImVec2(text1Pos.x, text1Pos.y + ImGui::GetFontSize() - 2.0f);
  ImGui::SetCursorScreenPos(text2Pos);
  ImGui::SetWindowFontScale(1.1f);
  ImGui::PushFont(italicFont);
  ImGui::TextUnformatted(description);
  ImGui::PopFont();
  ImGui::PopStyleColor();

  // Icon hoặc ký tự đặc biệt (nếu cần)
  float textHeight = ImGui::GetFontSize();
  float centeredY = pos.y + (size.y - textHeight) / 2.0f;
  ImVec2 iconPos = ImVec2(pos.x + size.x - 40.0f, centeredY - 18.0f);
  ImGui::SetCursorScreenPos(iconPos);
  ImGui::SetWindowFontScale(3.6f);
  ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(255, 255, 255, 255));
  ImGui::PushFont(iconFont);
  draw_list->AddText(iconPos, IM_COL32(255, 255, 255, 255), "7");
  ImGui::PopFont();
  ImGui::PopStyleColor();

  return clicked;
}

bool DrawToggleBoxdaihon(const char *label, const char *description, const char *uniqueID, bool isActive, ImFont *italicFont, ImFont *iconFont) {
  ImDrawList *draw_list = ImGui::GetWindowDrawList();
  ImVec2 pos = ImGui::GetCursorScreenPos();
  ImVec2 size = ImVec2(250.0f, 50.0f);
  ImVec2 end = ImVec2(pos.x + size.x, pos.y + size.y);

  // InvisibleButton bao phủ toàn bộ box để bắt sự kiện click
  ImGui::SetCursorScreenPos(pos);
  bool clicked = ImGui::InvisibleButton(uniqueID, size);

  // Nền tùy theo trạng thái bật/tắt
  ImU32 boxColor = isActive ? IM_COL32(255, 86, 102, 255) : IM_COL32(54, 22, 25, 255);
  draw_list->AddRectFilled(pos, end, boxColor, 15.0f);

  // Text chính
  ImVec2 text1Pos = ImVec2(pos.x + 15.5f, pos.y + 8.0f);
  ImGui::SetCursorScreenPos(text1Pos);
  ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(255, 255, 255, 255));
  ImGui::SetWindowFontScale(1.7f);
  ImGui::TextUnformatted(label);
  ImGui::PopStyleColor();

  // Text phụ
  if (isActive) {
    ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(104, 37, 35, 255));
  } else {
    ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(181, 101, 114, 255));
  }
  ImVec2 text2Pos = ImVec2(text1Pos.x, text1Pos.y + ImGui::GetFontSize() - 2.0f);
  ImGui::SetCursorScreenPos(text2Pos);
  ImGui::SetWindowFontScale(1.1f);
  ImGui::PushFont(italicFont);
  ImGui::TextUnformatted(description);
  ImGui::PopFont();
  ImGui::PopStyleColor();

  // Icon hoặc ký tự đặc biệt (nếu cần)
  float textHeight = ImGui::GetFontSize();
  float centeredY = pos.y + (size.y - textHeight) / 2.0f;
  ImVec2 iconPos = ImVec2(pos.x + size.x - 40.0f, centeredY - 18.0f);
  ImGui::SetCursorScreenPos(iconPos);
  ImGui::SetWindowFontScale(3.6f);
  ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(255, 255, 255, 255));
  ImGui::PushFont(iconFont);
  draw_list->AddText(iconPos, IM_COL32(255, 255, 255, 255), "7");
  ImGui::PopFont();
  ImGui::PopStyleColor();

  return clicked;
}
bool Checkbox(bool &funcFlag, const char *funcLabel, const char *funcDescription, ImFont *productSansFont) {
  bool changed = false;
  ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(9, 9));
  float cursorX = ImGui::GetCursorPosX();
  ImVec4 red = ImVec4(255 / 255.0f, 86 / 255.0f, 102 / 255.0f, 1.0f);
  float checkboxWidth = ImGui::GetFrameHeight();
  float spacing = 5.0f;

  if (funcFlag) {
    ImGui::PushStyleColor(ImGuiCol_CheckMark, ImVec4(1.0f, 1.0f, 1.0f, 1.0f));
    ImGui::PushStyleColor(ImGuiCol_FrameBg, red);
    ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(0.0f, 0.0f, 0.0f, 1.0f));
    ImGui::PushStyleColor(ImGuiCol_FrameBgHovered, ImVec4(1.0f, 1.0f, 1.0f, 1.0f));
  } else {
    ImVec4 xam = ImVec4(0.6f, 0.6f, 0.6f,
                        1.0f);  // Define xam if not already defined globally
    ImGui::PushStyleColor(ImGuiCol_CheckMark, xam);
    ImGui::PushStyleColor(ImGuiCol_FrameBg, ImVec4(50.0f / 255.0f, 50.0f / 255.0f, 50.0f / 255.0f, 1.0f));
    ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(0.0f, 0.0f, 0.0f, 1.0f));
    ImGui::PushStyleColor(ImGuiCol_FrameBgHovered, ImVec4(0.38f, 0.38f, 0.38f, 1.0f));
  }

  if (ImGui::Checkbox(funcLabel, &funcFlag)) {
    TriggerHapticFeedback();
    changed = true;
  }

  ImGui::PopStyleColor(4);
  ImGui::SameLine(checkboxWidth + spacing + cursorX);
  ImVec2 cursorPos = ImGui::GetCursorPos();
  ImGui::SetCursorPosY(cursorPos.y - 6.0f);
  ImGui::BeginGroup();

  ImGui::SetWindowFontScale(1.6f);
  ImGui::PushStyleColor(ImGuiCol_Header, ImVec4(0, 0, 0, 0));
  ImGui::PushStyleColor(ImGuiCol_HeaderHovered, ImVec4(0, 0, 0, 0));
  ImGui::PushStyleColor(ImGuiCol_HeaderActive, ImVec4(0, 0, 0, 0));

  if (ImGui::Selectable(funcLabel, false, ImGuiSelectableFlags_None)) {
    funcFlag = !funcFlag;
    TriggerHapticFeedback();
    changed = true;
  }

  ImGui::SetCursorPosY(ImGui::GetCursorPosY() - 3.0f);
  ImGui::PushFont(productSansFont);
  ImGui::SetWindowFontScale(1.0f);
  ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(160.0f / 255.0f, 160.0f / 255.0f, 160.0f / 255.0f, 1.0f));

  if (ImGui::Selectable(funcDescription, false, ImGuiSelectableFlags_None)) {
    funcFlag = !funcFlag;
    TriggerHapticFeedback();
    changed = true;
  }

  ImGui::PopFont();
  ImGui::PopStyleVar();
  ImGui::PopStyleColor();  // Text
  ImGui::EndGroup();
  ImGui::PopStyleColor(3);  // Header

  return changed;
}

- (void)updateIOWithTouchEvent:(UIEvent *)event {
  UITouch *anyTouch = event.allTouches.anyObject;
  CGPoint touchLocation = [anyTouch locationInView:self.view];
  ImGuiIO &io = ImGui::GetIO();
  io.MousePos = ImVec2(touchLocation.x, touchLocation.y);

  BOOL hasActiveTouch = NO;
  for (UITouch *touch in event.allTouches) {
    if (touch.phase != UITouchPhaseEnded && touch.phase != UITouchPhaseCancelled) {
      hasActiveTouch = YES;
      break;
    }
  }
  io.MouseDown[0] = hasActiveTouch;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  [self updateIOWithTouchEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  [self updateIOWithTouchEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  [self updateIOWithTouchEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  [self updateIOWithTouchEvent:event];
}

- (void)drawInMTKView:(MTKView *)view {
  // static bool Anten = loadState(kPlayerNameStateKey);
  static bool showthongbaokin = false;
  static bool showtblogsongsong = false;
  static bool showtblogsongsong3phut = false;
  static bool showtblogsschapto = false;
  static bool thongbaomodskin = false;
  static bool thongbaoautoflo = false;

  static id<MTLTexture> maintabimg = nil;
  if (maintabimg == nil) {
    NSString *base64String26 = defmaintabimg;
    std::string base64_std_string26([base64String26 UTF8String]);
    maintabimg = LoadTextureFromBase64(self.device, base64_std_string26);
  }
  static id<MTLTexture> background = nil;
  if (background == nil) {
    NSString *base64String26 = defbackground;
    std::string base64_std_string26([base64String26 UTF8String]);
    background = LoadTextureFromBase64(self.device, base64_std_string26);
  }
  static id<MTLTexture> aimtab = nil;
  if (aimtab == nil) {
    NSString *base64String26 = defaimtab;
    std::string base64_std_string26([base64String26 UTF8String]);
    aimtab = LoadTextureFromBase64(self.device, base64_std_string26);
  }
  static id<MTLTexture> autotab = nil;
  if (autotab == nil) {
    NSString *base64String26 = defautotab;
    std::string base64_std_string26([base64String26 UTF8String]);
    autotab = LoadTextureFromBase64(self.device, base64_std_string26);
  }
  static id<MTLTexture> esptab = nil;
  if (esptab == nil) {
    NSString *base64String26 = defesptab;
    std::string base64_std_string26([base64String26 UTF8String]);
    esptab = LoadTextureFromBase64(self.device, base64_std_string26);
  }
  static id<MTLTexture> modtab = nil;
  if (modtab == nil) {
    NSString *base64String26 = defmodtab;
    std::string base64_std_string26([base64String26 UTF8String]);
    modtab = LoadTextureFromBase64(self.device, base64_std_string26);
  }
  static id<MTLTexture> infotab = nil;
  if (infotab == nil) {
    NSString *base64String26 = definfotab;
    std::string base64_std_string26([base64String26 UTF8String]);
    infotab = LoadTextureFromBase64(self.device, base64_std_string26);
  }
  static id<MTLTexture> infotab2 = nil;
  if (infotab2 == nil) {
    NSString *base64String26 = definfotab2;
    std::string base64_std_string26([base64String26 UTF8String]);
    infotab2 = LoadTextureFromBase64(self.device, base64_std_string26);
  }
  static id<MTLTexture> thongbao = nil;
  if (thongbao == nil) {
    NSString *base64String26 = defthongbao;
    std::string base64_std_string26([base64String26 UTF8String]);
    thongbao = LoadTextureFromBase64(self.device, base64_std_string26);
  }
  hideRecordTextfield.secureTextEntry = StreamerMode;

  ImGuiIO &io = ImGui::GetIO();
  io.DisplaySize.x = view.bounds.size.width;
  io.DisplaySize.y = view.bounds.size.height;

  CGFloat framebufferScale = view.window.screen.nativeScale ?: UIScreen.mainScreen.nativeScale;
  io.DisplayFramebufferScale = ImVec2(framebufferScale, framebufferScale);
  io.DeltaTime = 1 / float(view.preferredFramesPerSecond ?: 60);

  // Attach();

  //  Il2CppAttach();
  id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];

  if (MenDeal != menuState.isVisible && !menuState.isTransitioning) {
    menuState.isVisible = MenDeal;
    menuState.transitionStart = std::chrono::steady_clock::now();
    menuState.isTransitioning = true;
  }

  if (MenDeal == true) {
    [self.view setUserInteractionEnabled:YES];
    [self.view.superview setUserInteractionEnabled:YES];
    [menuTouchView setUserInteractionEnabled:YES];

  } else if (MenDeal == false) {
    [self.view setUserInteractionEnabled:NO];
    [self.view.superview setUserInteractionEnabled:NO];
    [menuTouchView setUserInteractionEnabled:NO];
  }

  MTLRenderPassDescriptor *renderPassDescriptor = view.currentRenderPassDescriptor;
  if (renderPassDescriptor != nil) {
    id<MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
    [renderEncoder pushDebugGroup:@"ImGui Jane"];

    ImGui_ImplMetal_NewFrame(renderPassDescriptor);
    ImGui::NewFrame();

    ImFont *font = ImGui::GetFont();
    font->Scale = 11.5f / font->FontSize;

    ImFont *italicFont = self.italic;
    italicFont->Scale = 11.0f / italicFont->FontSize;

    ImFont *iconFont = self.icon131;
    iconFont->Scale = 13.0f / iconFont->FontSize;

    CGFloat x = (([UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width) - 420) / 2;
    CGFloat y = (([UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height) - 300) / 2;
    CGFloat width = 710;
    CGFloat height = 360;
    ImGui::SetNextWindowPos(ImVec2((kWidth - width) / 2, (kHeight - height) / 2), ImGuiCond_FirstUseEver);
    ImGui::SetNextWindowSize(ImVec2(width, height), ImGuiCond_FirstUseEver);
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      hook1();
      LoadComboNut();
      LoadCachChoiState();
    });

    if (autobocpha || Ksbs || autott || AimSkill || autotulen || autoveres) {
      static dispatch_once_t onceToken;
      dispatch_once(&onceToken, ^{
        HookUnity((uint64_t)GET_OFFSET(oxorany("Project_d.dll"), oxorany("Assets.Scripts.GameLogic"), oxorany("SkillSlot"), oxorany("LateUpdate"), 1), Skslot, _Skslot);  // autobocpha
      });
    }

    if (modpro5) {
      static dispatch_once_t onceToken;
      dispatch_once(&onceToken, ^{
        HookUnity((uint64_t)GET_OFFSET("Project_d.dll", "Assets.Scripts.GameSystem", "PVPLoadingView", "TryShowLegendRank", 6), _TryShowLegendRank, TryShowLegendRank);
        HookUnity((uint64_t)GET_OFFSET("Project_d.dll", "Assets.Scripts.GameSystem", "PVPLoadingView", "IsShowLegendRankMode", 1), _IsShowLegendRankMode, IsShowLegendRankMode);
        HookUnity((uint64_t)GET_OFFSET("AovTdr.dll", "CSProtocol", "COMDT_TOP_OR_AREA_LEGEND_TITLE_INFO", "unpack", 2), _unpackTop, unpackTop);
        HookUnity((uint64_t)GET_OFFSET("Project_d.dll", "Assets.Scripts.GameSystem", "PVPLoadingView", "CanPlayerShowLegendRank", 8), _CanPlayerShowLegendRank, CanPlayerShowLegendRank);

        HookUnity((uint64_t)GET_OFFSET("Project_d.dll", "Assets.Scripts.GameSystem", "CRoleInfoManager", "GetMasterRoleInfo", 0), GetMasterRoleInfo, _GetMasterRoleInfo);
        HookUnity((uint64_t)GET_OFFSET("Project_d.dll", "Assets.Scripts.GameSystem", "CLadderSystem", "GetCurrentRankDetail", 0), GetCurrentRankDetail, _GetCurrentRankDetail);
        get_VHostLogic = (void *(*)())GET_OFFSET(("Project_d.dll"), ("Kyrios"), ("KyriosFramework"), ("get_hostLogic"), 0);
      });
    }

    if (MenDeal == true) {
      ImGui::Begin(ENCRYPT("TruongMods"), &MenDeal, ImGuiWindowFlags_NoScrollbar | ImGuiWindowFlags_NoScrollWithMouse | ImGuiWindowFlags_NoCollapse | ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoResize);
      ImDrawList *draw = ImGui::GetWindowDrawList();

      ImVec2 windowPos = ImGui::GetWindowPos();
      ImVec2 windowSize = ImGui::GetWindowSize();

      if (thongbaolandau) {
        ImGui::SetNextWindowPos(ImVec2((kWidth - width) / 2, (kHeight - height) / 2), ImGuiCond_FirstUseEver);
        ImGui::SetNextWindowSize(ImVec2(width, height), ImGuiCond_FirstUseEver);
        ImGui::SetNextWindowBgAlpha(0.0f);  // Hoàn toàn trong suốt

        ImGui::Begin("##block_input", nullptr, ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoMove);
        ImGui::End();
        ImDrawList *fg = ImGui::GetForegroundDrawList();
        ImVec2 screen_min = ImGui::GetMainViewport()->Pos;
        ImVec2 screen_max = screen_min + ImGui::GetMainViewport()->Size;
        // Blur background (dark overlay)
        fg->AddRectFilled(screen_min, screen_max, IM_COL32(0, 0, 5, 210));
        
        ImVec2 rect_size = ImVec2(500, 240);
        ImVec2 center = ImGui::GetMainViewport()->GetCenter();
        ImVec2 rect_min = center - rect_size * 0.5f;
        ImVec2 rect_max = rect_min + rect_size;

        // Vẽ nền hình chữ nhật glassmorphism
        fg->AddRectFilled(rect_min, rect_max, IM_COL32(20, 20, 25, 240), 20.0f);
        fg->AddRect(rect_min, rect_max, IM_COL32(255, 86, 102, 100), 20.0f, 0, 2.0f);

        if (thongbao) {
          fg->AddImage((__bridge void *)thongbao, rect_min, rect_max);
        }
        
        ImGui::SetWindowFontScale(3.5f);
        ImVec2 text1_pos = rect_min + ImVec2(30, 20);
        fg->AddText(text1_pos, IM_COL32(255, 86, 102, 255), "WELCOME");
        
        ImGui::SetWindowFontScale(1.3f);
        ImVec2 text2_pos = rect_min + ImVec2(30, 70);
        fg->AddText(text2_pos, IM_COL32(220, 220, 220, 255),
                    "Chào Mừng Bạn Đến Với TRUONGMODS (Phiên bản 2026)\n"
                    "Cấu hình giao diện đã được tự động lưu lại.\n"
                    "Hãy trải nghiệm không gian Mod hiện đại, mượt mà.\n\n"
                    "Chúc Bạn Chơi Game Vui Vẻ");
        
        // Nút cancel
        ImVec2 btn1_pos = rect_min + ImVec2(30, 180);
        ImVec2 btn_size = ImVec2(130, 40);
        ImVec2 btn2_pos = btn1_pos + ImVec2(130 + 15, 0);
        
        ImU32 btn_color = IM_COL32(255, 86, 102, 255);
        fg->AddRectFilled(btn1_pos, btn1_pos + btn_size, btn_color, 12.0f);
        const char *text1 = "Đóng";
        ImVec2 text1_size = ImGui::CalcTextSize(text1);
        ImVec2 text1_poss = btn1_pos + (btn_size - text1_size) * 0.5f;
        fg->AddText(text1_poss, IM_COL32_WHITE, text1);
        
        fg->AddRectFilled(btn2_pos, btn2_pos + btn_size, btn_color, 12.0f);
        const char *text2 = "Đóng Vĩnh Viễn";
        ImVec2 text2_size = ImGui::CalcTextSize(text2);
        ImVec2 text2_poss = btn2_pos + (btn_size - text2_size) * 0.5f;
        fg->AddText(text2_poss, IM_COL32_WHITE, text2);
        
        // Xử lý click thủ công
        ImVec2 mouse = ImGui::GetIO().MousePos;
        bool click = ImGui::IsMouseClicked(0);
        if (click && ImGui::IsMouseHoveringRect(btn1_pos, btn1_pos + btn_size)) {
          TriggerHapticFeedback();
          thongbaolandau = false;
        }
        if (click && ImGui::IsMouseHoveringRect(btn2_pos, btn2_pos + btn_size)) {
          TriggerHapticFeedback();
          thongbaolandau = false;
          saveStateBool(kThongbaolandauStateKey, thongbaolandau);
        }
      }

      if (background) {
        ImGui::SetCursorScreenPos(ImVec2(windowPos.x - 1.0f, windowPos.y - 1.0f));

        ImGui::Image((__bridge void *)background, ImVec2(710, 360));
      }
      if (Settings::Tab == 1) {
        if (maintabimg) {
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 74.0f, windowPos.y - 1.0f));

          ImGui::Image((__bridge void *)maintabimg, ImVec2(470, 196));
        }
      }
      if (Settings::Tab == 2) {
        if (aimtab) {
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 402.3f, windowPos.y + 40.5f));
          ImGui::Image((__bridge void *)aimtab, ImVec2(318.5f, 292.1));
        }
        ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 95.0f, windowPos.y + 29.0f));

        // Đặt màu chữ: #B56572 (RGB: 181, 101, 114)
        ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(181 / 255.0f, 101 / 255.0f, 114 / 255.0f, 1.0f));

        // In dòng chữ
        ImGui::SetWindowFontScale(1.9f);
        ImGui::Text("AIMBOT");
        ImGui::SameLine();
        ImGui::PopStyleColor();
        ImGui::Text("TỰ ĐỘNG ĐỊNH HƯỚNG");
      }

      if (Settings::Tab == 3) {
        if (autotab) {
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 291.3f, windowPos.y + 39.1f));

          ImGui::Image((__bridge void *)autotab, ImVec2(463.6f, 294.1));
        }
        ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 95.0f, windowPos.y + 29.0f));
        ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(181 / 255.0f, 101 / 255.0f, 114 / 255.0f, 1.0f));
        ImGui::SetWindowFontScale(1.9f);
        ImGui::Text("AUTOPLAY");
        ImGui::SameLine();
        ImGui::PopStyleColor();
        if (botrotab) {
          ImGui::Text("BỔ TRỢ / PHỤ TRỢ");
        }
        if (macrotab) {
          ImGui::Text("MACRO AUTO");
        }
        if (bandotab) {
          ImGui::Text("AUTO BÁN ĐỒ");
        }
      }

      if (Settings::Tab == 4) {
        if (esptab) {
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 299.0f, windowPos.y + 10.0f));

          ImGui::Image((__bridge void *)esptab, ImVec2(390.3f, 322.7f));
        }
        ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 95.0f, windowPos.y + 29.0f));
        ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(181 / 255.0f, 101 / 255.0f, 114 / 255.0f, 1.0f));
        ImGui::SetWindowFontScale(1.9f);
        ImGui::Text("ESP");
        ImGui::SameLine();
        ImGui::PopStyleColor();
        ImGui::Text("ẨN LIVESTREAM / VIDEO");
      }

      if (Settings::Tab == 5) {
        ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 95.0f, windowPos.y + 29.0f));
        ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(181 / 255.0f, 101 / 255.0f, 114 / 255.0f, 1.0f));
        ImGui::SetWindowFontScale(1.9f);
        ImGui::Text("MOD");
        ImGui::SameLine();
        ImGui::PopStyleColor();
        ImGui::Text("TOOL MOD GAME");
        if (modtab) {
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 338.2f, windowPos.y + 2.5f));

          ImGui::Image((__bridge void *)modtab, ImVec2(371.3f, 329.0f));
        }
        {
          ImVec2 btnClosePos = ImVec2(windowPos.x + 500, windowPos.y + 256);
          ImVec2 btnSize = ImVec2(155, 48);

          ImGui::SetCursorScreenPos(btnClosePos);
          if (ImGui::InvisibleButton("openmain", btnSize)) {
            Settings::Tab = 1;
          }

          draw->AddRect(btnClosePos, btnClosePos + btnSize, IM_COL32(255, 255, 255, 0), 10.0f);
          draw->AddText(btnClosePos + ImVec2(50, 15), IM_COL32(255, 255, 255, 0), "openmain");
        }
      }
      if (Settings::Tab == 6) {
        ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 95.0f, windowPos.y + 29.0f));
        ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(181 / 255.0f, 101 / 255.0f, 114 / 255.0f, 1.0f));
        ImGui::SetWindowFontScale(1.9f);
        ImGui::Text("INFORMATION");
        ImGui::SameLine();
        ImGui::PopStyleColor();
        ImGui::Text("PLAYER");
        if (infotab) {
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 358.4f, windowPos.y + 2.0f));

          ImGui::Image((__bridge void *)infotab, ImVec2(369.1f, 329.1f));
        }
        if (infotab2) {
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 93.0f, windowPos.y + 55.0f));

          ImGui::Image((__bridge void *)infotab2, ImVec2(360.1f, 58.6f));
        }
        {
          ImVec2 btnClosePos = ImVec2(windowPos.x + 500, windowPos.y + 256);
          ImVec2 btnSize = ImVec2(155, 48);

          ImGui::SetCursorScreenPos(btnClosePos);
          if (ImGui::InvisibleButton("openmain", btnSize)) {
            Settings::Tab = 1;
          }

          draw->AddRect(btnClosePos, btnClosePos + btnSize, IM_COL32(255, 255, 255, 0), 10.0f);
          draw->AddText(btnClosePos + ImVec2(50, 15), IM_COL32(255, 255, 255, 0), "openmain");
        }
        
      }
      if (Settings::Tab == 7) {
        ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 95.0f, windowPos.y + 29.0f));
        ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(181 / 255.0f, 101 / 255.0f, 114 / 255.0f, 1.0f));
        ImGui::SetWindowFontScale(1.9f);
        ImGui::Text("CHỨC NĂNG KHÁC");
        ImGui::SameLine();
        ImGui::PopStyleColor();
        ImGui::Text("MOREEE");
        if (infotab) {
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 358.4f, windowPos.y + 2.0f));

          ImGui::Image((__bridge void *)infotab, ImVec2(369.1f, 329.1f));
        }
        {
          ImVec2 btnClosePos = ImVec2(windowPos.x + 500, windowPos.y + 256);
          ImVec2 btnSize = ImVec2(155, 48);

          ImGui::SetCursorScreenPos(btnClosePos);
          if (ImGui::InvisibleButton("openmain", btnSize)) {
            Settings::Tab = 1;
          }

          draw->AddRect(btnClosePos, btnClosePos + btnSize, IM_COL32(255, 255, 255, 0), 10.0f);
          draw->AddText(btnClosePos + ImVec2(50, 15), IM_COL32(255, 255, 255, 0), "openmain");
        }
      }
      {
        ImGui::SetWindowFontScale(1.6f);
        ImVec2 versionBoxPos = ImVec2(windowPos.x + 471.0f, windowPos.y + 20.0f);
        ImVec2 versionBoxSize = ImVec2(169.0f, 37.5f);
        draw->AddRectFilled(versionBoxPos, ImVec2(versionBoxPos.x + versionBoxSize.x, versionBoxPos.y + versionBoxSize.y), IM_COL32(54, 22, 25, 255), 8.0f);

        const char *versionText = "VERSION 7.0 | S2 26";
        ImVec2 textSize = ImGui::CalcTextSize(versionText);
        ImVec2 textPos = ImVec2(versionBoxPos.x + (versionBoxSize.x - textSize.x) / 2.0f, versionBoxPos.y + (versionBoxSize.y - textSize.y) / 2.0f);

        draw->AddText(textPos, IM_COL32(194, 69, 65, 255), versionText);
        ImVec2 squarePos = ImVec2(versionBoxPos.x + versionBoxSize.x + 7.0f, versionBoxPos.y);
        ImVec2 squareSize = ImVec2(37.5f, 37.5f);
        ImGui::SetCursorScreenPos(squarePos);
        if (ImGui::InvisibleButton("CloseBtn", squareSize)) {
          MenDeal = false;
        }
        draw->AddRectFilled(squarePos, ImVec2(squarePos.x + squareSize.x, squarePos.y + squareSize.y), IM_COL32(54, 22, 25, 255), 8.0f);
        ImGui::PushFont(self.icon131);
        ImGui::SetWindowFontScale(1.6f);
        const char *symbolText = "`";
        ImVec2 symbolSize = ImGui::CalcTextSize(symbolText);
        ImVec2 symbolPos = ImVec2(squarePos.x + (squareSize.x - symbolSize.x) / 2.0f, squarePos.y + (squareSize.y - symbolSize.y) / 2.0f);
        draw->AddText(symbolPos, IM_COL32(255, 255, 255, 255), symbolText);
        ImGui::PopFont();
      }
      ImGui::SetWindowFontScale(2.75f);

      // CỘT BÊN TRÁI (Modern Sidebar 2026)
      {
        ImGui::PushFont(self.icon131);
        ImVec2 rectPos = ImVec2(windowPos.x + 15, windowPos.y + 15);
        ImVec2 rectSize = ImVec2(rectPos.x + 70, rectPos.y + 340);

        ImDrawList *draw_list = ImGui::GetWindowDrawList();
        // Glassmorphism sidebar background
        draw_list->AddRectFilled(rectPos, rectSize, IM_COL32(20, 20, 25, 220), 20.0f);
        draw_list->AddRect(rectPos, rectSize, IM_COL32(255, 86, 102, 80), 20.0f, 0, 1.5f); // Subtle border

        float buttonWidth = 50.0f;
        float buttonHeight = 40.0f;
        float centerX = rectPos.x + 10.0f;
        ImVec2 textOffset = ImVec2(17, 10);

        // Duyệt 7 nút
        for (int i = 0; i < 7; ++i) {
          int tabValue = i + 1;
          ImVec2 pos = ImVec2(centerX, rectPos.y + 15.0f + i * (buttonHeight + 5.0f));
          ImGui::SetCursorScreenPos(pos);

          char btnId[8];
          sprintf(btnId, "btn%d", tabValue);
          bool isHovered = false;
          if (ImGui::InvisibleButton(btnId, ImVec2(buttonWidth, buttonHeight))) {
            Settings::Tab = tabValue;
            TriggerHapticFeedback();
          }
          isHovered = ImGui::IsItemHovered();

          // Kiểm tra nếu nút này được chọn
          bool isActive = (Settings::Tab == tabValue);

          // Chỉnh màu nút
          ImU32 btnBgColor = isActive ? IM_COL32(255, 86, 102, 255) : (isHovered ? IM_COL32(50, 50, 60, 255) : IM_COL32(0,0,0,0));
          draw_list->AddRectFilled(pos, ImVec2(pos.x + buttonWidth, pos.y + buttonHeight), btnBgColor, 12.0f);
          
          if (isActive) {
              // Thêm glow effect mờ nhẹ
              draw_list->AddRectFilled(ImVec2(pos.x-2, pos.y-2), ImVec2(pos.x + buttonWidth+2, pos.y + buttonHeight+2), IM_COL32(255, 86, 102, 50), 12.0f);
          }

          ImGui::SetWindowFontScale(2.5f);
          ImU32 textColor = isActive ? IM_COL32(255, 255, 255, 255) : IM_COL32(180, 180, 180, 255);

          char label[8];
          sprintf(label, " %d ", tabValue);
          draw_list->AddText(pos + textOffset, textColor, label);
        }
        ImGui::PopFont();
      }
      // CỘT BÊN PHẢI
      ImGui::NextColumn();
      ImGui::PushStyleColor(ImGuiCol_WindowBg, ImVec4(0 / 255.0f, 0 / 255.0f, 0 / 255.0f, 1.0f));
      ImFont *font = ImGui::GetIO().Fonts->Fonts[0];  // Get the first font from the font atlas
      ImGui::PushFont(font);                          // Push the font
      ImGui::SetWindowFontScale(1.2f);                // Set the font scale (18.0f / default font size)
      // Right side content based on selected tab

      static int lastTab = -1;
      if (Settings::Tab != lastTab) {
        ResetTabAnimations();
        lastTab = Settings::Tab;
      }

      if (Settings::Tab >= 1 && Settings::Tab <= 10) {
        UpdateTabAnimation(Settings::Tab);
        float alpha = tabAnimations[Settings::Tab].alpha;
        ImGui::PushStyleVar(ImGuiStyleVar_Alpha, alpha);

        if (Settings::Tab == 1) {
          // Lấy thời gian hệ thống
          time_t now = time(0);
          tm *localTime = localtime(&now);
          int hour = localTime->tm_hour;
          int minute = localTime->tm_min;

          // Xác định lời chào theo khung giờ
          const char *greeting = "";
          if (hour < 12 || (hour == 12 && minute == 0)) {
            greeting = "CHÀO BUỔI SÁNG,";
          } else if ((hour == 12 && minute >= 1) || (hour < 18) || (hour == 18 && minute <= 30)) {
            greeting = "CHÀO BUỔI CHIỀU,";
          } else if ((hour == 18 && minute >= 31) || (hour < 21) || (hour == 21 && minute <= 30)) {
            greeting = "CHÀO BUỔI TỐI,";
          } else {
            greeting = "CHÀO BUỔI TỐI,";
          }

          // Đặt vị trí con trỏ theo tọa độ màn hình
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 95.0f, windowPos.y + 29.0f));

          // Đặt màu chữ: #FF5666 (Màu 2026)
          ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(1.0f, 0.34f, 0.4f, 1.0f));

          // In dòng chữ
          ImGui::SetWindowFontScale(2.1f);
          ImGui::Text("%s", greeting);
          ImGui::SameLine();
          ImGui::PopStyleColor();
          ImGui::Text(" TRUONGMODS USER");
          {
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 471.0f, windowPos.y + 65.0f));
            if (DrawAimbotBox("AIMBOT", "Aimbot Tướng Elsu, Gildur,...", self.italic, self.icon131, "aimbot")) {
              Settings::Tab = 2;
              TriggerHapticFeedback();
            }

            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 471.0f, windowPos.y + 121.0f));
            if (DrawAimbotBox("AUTOMATIC", "Macro Tự Động Dùng Chiêu", self.italic, self.icon131, "auto")) {
              Settings::Tab = 3;
              TriggerHapticFeedback();
            }

            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 471.0f, windowPos.y + 177.0f));
            if (DrawAimbotBox("ESP", "ESP Giúp Ẩn Hack Khi Quay", self.italic, self.icon131, "esp")) {
              Settings::Tab = 4;
              TriggerHapticFeedback();
            }

            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 471.0f, windowPos.y + 233.0f));
            if (DrawAimbotBox("MOD", "Mod Skin | Nút | TB Hạ | Rank", self.italic, self.icon131, "mod")) {
              Settings::Tab = 5;
              TriggerHapticFeedback();
            }

            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 471.0f, windowPos.y + 289.0f));

            if (DrawAimbotBox("EXTRA", "Cấu Hình Chế Độ Chơi Tại Đây", self.italic, self.icon131, "extra")) {
              Settings::Tab = 7;
              TriggerHapticFeedback();
            }
          }
          {
            ImGui::SetWindowFontScale(1.5f);
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 285.0f, windowPos.y + 181.0f));
            if (Checkbox(skillcd, "Ulti Cooldown", "Hiển Thị Thời Gian Hồi Ulti", self.italic)) {
              TriggerHapticFeedback();
              saveState(kSkillCDStateKey, skillcd);
            }
            ImGui::SetWindowFontScale(1.5f);
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 285.0f, windowPos.y + 223.0f));
            if (Checkbox(unlockskin, "Unlock Full Skin", "Mở Khoá Skin | Tránh Skin SSS", self.italic)) {
              TriggerHapticFeedback();
              saveState(kunlockskinStateKey, unlockskin);
            }
            ImGui::SetWindowFontScale(1.5f);
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 97.0f, windowPos.y + 181.0f));
            if (Checkbox(MapHack, "Map Hack", "Hiển Thị Tầm Nhìn", self.italic)) {
              TriggerHapticFeedback();
              saveState(kMapStateKey, MapHack);
            }
            ImGui::SetWindowFontScale(1.5f);
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 97.0f, windowPos.y + 223.0f));
            if (Checkbox(showcd, "Name Cooldown", "Đổi Tên Thành Hồi Chiêu", self.italic)) {
              TriggerHapticFeedback();
              saveState(kShowSkillCDStateKey, showcd);
            }
          }

          ImGui::SetWindowFontScale(1.0f);

          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 97.0f, windowPos.y + 265.0f));
          ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(11, 13));
          ImGui::PushStyleVar(ImGuiStyleVar_GrabMinSize, 35);
          ImGui::PushStyleVar(ImGuiStyleVar_GrabRounding, 10);
          ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 10);
          ImGui::SetNextItemWidth(275);
          if (lockcam) {
            ImGui::PushItemFlag(ImGuiItemFlags_Disabled, true);
            ImGui::PushStyleVar(ImGuiStyleVar_Alpha, ImGui::GetStyle().Alpha * 0.5f);
          }

          ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(4.0f, ImGui::GetStyle().FramePadding.y - 1.0f));

          if (ImGui::SliderFloat("##camview", &camera, 0.5f, 6.0f, "Góc Nhìn Thẳng : %.2f ")) {
            saveCameraState(camera);
            TriggerHapticFeedback();
          }

          ImGui::PopStyleVar();  // FramePadding

          if (lockcam) {
            ImGui::PopStyleVar();  // Alpha
            ImGui::PopItemFlag();
          }

          ImGui::SameLine();
          ImGui::PushStyleColor(ImGuiCol_Button, lockcam ? red : ImVec4(0.3f, 0.3f, 0.3f, 1.0f));
          ImGui::PushStyleColor(ImGuiCol_ButtonActive, lockcam ? red : ImVec4(0.3f, 0.3f, 0.3f, 1.0f));
          ImGui::PushStyleColor(ImGuiCol_ButtonHovered, lockcam ? red : ImVec4(0.3f, 0.3f, 0.3f, 1.0f));

          if (ImGui::Button("Khoá Cam", ImVec2(70, 37))) {
            lockcam = !lockcam;
            TriggerHapticFeedback();
          }

          ImGui::PopStyleColor(3);
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 97.0f, windowPos.y + 305.0f));
          ImGui::SetNextItemWidth(350 + 10);
          ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(4.0f, ImGui::GetStyle().FramePadding.y - 1.0f));

          if (ImGui::SliderFloat("##fovview", &drone, 0.5f, 20.0f, "Góc Nhìn Nghiêng : %.2f ")) {
            saveDroneState(drone);
            TriggerHapticFeedback();
          }
          ImGui::PopStyleVar();  // FramePadding

          ImGui::PopStyleVar(3);
        } else if (Settings::Tab == 2) {
          {
            ImVec2 pos = ImVec2(windowPos.x + 100.0f, windowPos.y + 50.0f);
            ImVec2 size = ImVec2(180.0f, 45.0f);
            ImVec2 end = ImVec2(pos.x + size.x, pos.y + size.y);

            ImDrawList *draw_list = ImGui::GetWindowDrawList();

            // Invisible button để bật/tắt
            ImGui::SetCursorScreenPos(pos);
            if (ImGui::InvisibleButton("toggleAimbot", size)) {
              AimSkill = !AimSkill;
            }

            // Màu nền
            ImU32 bgColor = AimSkill ? IM_COL32(255, 86, 102, 255) : IM_COL32(40, 40, 45, 255);
            draw_list->AddRectFilled(pos, end, bgColor, 15.0f);
            if(AimSkill) {
                draw_list->AddRectFilled(ImVec2(pos.x-2, pos.y-2), ImVec2(end.x+2, end.y+2), IM_COL32(255, 86, 102, 60), 15.0f);
            }

            // Căn giữa text
            ImGui::SetWindowFontScale(1.4f);
            const char *label = "BẬT AIMBOT";
            ImVec2 textSize = ImGui::CalcTextSize(label);
            float baseTextX = pos.x + (size.x - textSize.x) / 2.0f;
            float textY = pos.y + (size.y - textSize.y) / 2.0f;

            // Hiệu ứng trượt mượt hơn với DeltaTime
            static float textOffset = 0.0f;
            float targetOffset = AimSkill ? 5.0f : 0.0f;
            float speed = 12.0f;  // tốc độ mượt, càng cao càng nhanh
            float deltaTime = ImGui::GetIO().DeltaTime;
            textOffset += (targetOffset - textOffset) * speed * deltaTime;

            float textX = baseTextX + textOffset;
            draw_list->AddText(ImVec2(textX, textY), IM_COL32(255, 255, 255, 255), label);

            if (AimSkill) {
              ImGui::SetWindowFontScale(2.1f);
              draw_list->AddText(ImVec2(textX - 20.0f, textY - 4.0f), IM_COL32(255, 255, 255, 255), "~ ");
            }
          }
          float curY = windowPos.y + 115.0f;
          float leftX = windowPos.x + 100.0f;

          // ---- "CHỌN SKILL AIM:" label ----
          ImGui::SetCursorScreenPos(ImVec2(leftX, curY));
          ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(1.0f, 0.34f, 0.4f, 1.0f));
          ImGui::SetWindowFontScale(1.4f);
          ImGui::Text("CHỌN SKILL AIM:");
          ImGui::PopStyleColor();
          curY += 25.0f + 5.0f;  // text height + gap

          // ---- Skill 1/2/3 Buttons ----
          {
            float skillBtnH = 40.0f;
            auto drawSkillBtn = [&](const char *id, const char *label, bool &val, ImVec2 btnPos) {
              ImVec2 btnSize = ImVec2(100.0f, skillBtnH);
              ImGui::SetCursorScreenPos(btnPos);
              if (ImGui::InvisibleButton(id, btnSize)) {
                val = !val;
              }
              ImU32 bgc = val ? IM_COL32(255, 86, 102, 255) : IM_COL32(40, 40, 45, 255);
              draw->AddRectFilled(btnPos, ImVec2(btnPos.x + btnSize.x, btnPos.y + btnSize.y), bgc, 8.0f);
              ImVec2 tSize = ImGui::CalcTextSize(label);
              draw->AddText(ImVec2(btnPos.x + (btnSize.x - tSize.x) / 2.0f, btnPos.y + (btnSize.y - tSize.y) / 2.0f), IM_COL32(255, 255, 255, 255), label);
            };
            drawSkillBtn("sk1btn", "Skill 1", AimSkill1, ImVec2(leftX, curY));
            drawSkillBtn("sk2btn", "Skill 2", AimSkill2, ImVec2(leftX + 110.0f, curY));
            drawSkillBtn("sk3btn", "Skill 3", AimSkill3, ImVec2(leftX + 220.0f, curY));
            curY += skillBtnH + 15.0f;
          }

          // ---- Hero Selector (AutoHero) ----
          ImGui::SetCursorScreenPos(ImVec2(leftX, curY));
          ImGui::SetWindowFontScale(1.3f);
          ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(12, 12));
          ImGui::SetNextItemWidth(320);
          AutoHero();
          ImGui::PopStyleVar();
          curY += 45.0f + 10.0f;  // combo height + gap

          // ---- KhoangCach Slider ----
          ImGui::SetCursorScreenPos(ImVec2(leftX, curY));
          ImGui::SetWindowFontScale(1.3f);
          ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(10, 10));
          ImGui::SetNextItemWidth(320);
          if (ImGui::SliderFloat("##kMAim", &KhoangCach, 0.0f, 30.0f, "Tầm Aim: %.1f m")) {
            AutoSet = true;
          }
          curY += 32.0f + 5.0f;  // slider height + gap

          // ---- DoLechAim Slider ----
          ImGui::SetCursorScreenPos(ImVec2(leftX, curY));
          ImGui::SetNextItemWidth(320);
          if (ImGui::SliderFloat("##DolechAim", &DoLechAim, 0.0f, 5.0f, "Độ Lệch: %.3f")) {
            AutoSet = true;
          }
          ImGui::PopStyleVar();
        } else if (Settings::Tab == 3) {
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 95.5f, windowPos.y + 58.5f));
          if (DrawToggleBox("BỔ TRỢ", "Auto Dùng Bổ Trợ", "botroToggle", botrotab, self.italic, self.icon131)) {
            macrotab = false;
            botrotab = true;
            bandotab = false;
          }
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 254.5f, windowPos.y + 58.5f));
          if (DrawToggleBox("MACRO", "Macro Tự Động", "macroToggle", macrotab, self.italic, self.icon131)) {
            botrotab = false;
            macrotab = true;
            bandotab = false;
          }
          if (botrotab) {
            ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(1.0f, 0.34f, 0.4f, 1.0f));
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 115.0f));
            ImGui::SetWindowFontScale(1.4f);
            ImGui::Text("TỰ ĐỘNG DÙNG BỔ TRỢ");
            ImGui::SameLine();
            ImGui::PopStyleColor();
            ImGui::Text("( BỘC PHÁ )");
            ImGui::SetWindowFontScale(1.5f);
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 140.0f));
            ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(10, 10));
            if (autobocpha) {
              ImGui::PushStyleColor(ImGuiCol_CheckMark, ImVec4(1.0f, 1.0f, 1.0f, 1.0f));
              ImGui::PushStyleColor(ImGuiCol_FrameBg, ImVec4(1.0f, 0.34f, 0.4f, 1.0f));
              ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(1.0f, 1.0f, 1.0f, 1.0f));
              ImGui::PushStyleColor(ImGuiCol_FrameBgHovered, ImVec4(1.0f, 0.45f, 0.5f, 1.0f));
            } else {
              ImGui::PushStyleColor(ImGuiCol_CheckMark, ImVec4(0.5f, 0.5f, 0.5f, 1.0f));
              ImGui::PushStyleColor(ImGuiCol_FrameBg, ImVec4(0.15f, 0.15f, 0.18f, 1.0f));
              ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(0.8f, 0.8f, 0.8f, 1.0f));
              ImGui::PushStyleColor(ImGuiCol_FrameBgHovered, ImVec4(0.2f, 0.2f, 0.24f, 1.0f));
            }
            ImGui::Checkbox("##autobocpha", &autobocpha);
            ImGui::PopStyleColor(4);

            ImGui::PopStyleVar();
            ImGui::SameLine();
            ImGui::SetWindowFontScale(1.2f);

            ImGui::SetWindowFontScale(1.2f);
            ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(10, 10));
            ImGui::SetNextItemWidth(270);
            if (ImGui::SliderFloat("##botro", &maubotro, 0.0f, 15.0f, "DÙNG KHI MÁU ĐỊCH DƯỚI : %.2f %%")) {
              TriggerHapticFeedback();
              saveFloatState(kmaubotroKey, maubotro);
            };
            ImGui::PopStyleVar(1);
            ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(1.0f, 0.34f, 0.4f, 1.0f));
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 190.0f));
            ImGui::SetWindowFontScale(1.4f);
            ImGui::Text("TỰ ĐỘNG DÙNG PHỤ TRỢ");
            ImGui::SameLine();
            ImGui::PopStyleColor();
            ImGui::Text("( ĐỒ KÍCH HOẠT / ĐỒ TRỢ THỦ )");
            ImGui::SetWindowFontScale(1.5f);
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 215.0f));
            ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(10, 10));
            if (Ksbs) {
              ImGui::PushStyleColor(ImGuiCol_CheckMark, ImVec4(1.0f, 1.0f, 1.0f, 1.0f));
              ImGui::PushStyleColor(ImGuiCol_FrameBg, ImVec4(1.0f, 0.34f, 0.4f, 1.0f));
              ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(1.0f, 1.0f, 1.0f, 1.0f));
              ImGui::PushStyleColor(ImGuiCol_FrameBgHovered, ImVec4(1.0f, 0.45f, 0.5f, 1.0f));
            } else {
              ImGui::PushStyleColor(ImGuiCol_CheckMark, ImVec4(0.5f, 0.5f, 0.5f, 1.0f));
              ImGui::PushStyleColor(ImGuiCol_FrameBg, ImVec4(0.15f, 0.15f, 0.18f, 1.0f));
              ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(0.8f, 0.8f, 0.8f, 1.0f));
              ImGui::PushStyleColor(ImGuiCol_FrameBgHovered, ImVec4(0.2f, 0.2f, 0.24f, 1.0f));
            }
            ImGui::Checkbox("##Ksbs", &Ksbs);
            ImGui::PopStyleColor(4);

            ImGui::PopStyleVar();
            ImGui::SameLine();
            ImGui::SetWindowFontScale(1.2f);
            ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(12, 12));
            ImGui::PushStyleVar(ImGuiStyleVar_GrabMinSize, 30);
            ImGui::PushStyleVar(ImGuiStyleVar_GrabRounding, 10);
            ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 10);
            ImGui::SetNextItemWidth(270);
            if (ImGui::SliderFloat("##phutro", &mauphutro, 0.0f, 70.0f, "DÙNG KHI MÁU BẢN THÂN DƯỚI : %.2f %%")) {
              saveFloatState(kmauphutroKey, mauphutro);
              TriggerHapticFeedback();
            };
            ImGui::PopStyleVar(4);
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 265.0f));
            ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(1.0f, 0.34f, 0.4f, 1.0f));
            ImGui::SetWindowFontScale(1.4f);
            ImGui::Text("TỰ ĐỘNG TRỪNG TRỊ");
            ImGui::SameLine();
            ImGui::PopStyleColor();
            ImGui::Text("TỰ ĐỘNG CHECK BÙA HẠI");
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 285.0f));
            if (bua || rongta) {
              autott = true;
            } else {
              autott = false;
            }
            {
              ImVec2 pos = ImVec2(windowPos.x + 100.0f, windowPos.y + 290.0f);
              ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 290.0f));
              ImVec2 size = ImVec2(151.0f, 35.0f);
              ImVec2 end = ImVec2(pos.x + size.x, pos.y + size.y);

              ImDrawList *draw_list = ImGui::GetWindowDrawList();

              // Invisible button để bật/tắt
              if (ImGui::InvisibleButton("Buaxanh", size)) {
                bua = !bua;
              }

              // Màu nềnhk nh
              ImU32 bgColor = bua ? IM_COL32(255, 86, 102, 255) : IM_COL32(40, 40, 45, 255);
              draw_list->AddRectFilled(pos, end, bgColor, 50.0f);

              // Căn giữa text
              ImGui::SetWindowFontScale(1.3f);
              const char *label = "BÙA XANH / ĐỎ";
              ImVec2 textSize = ImGui::CalcTextSize(label);
              float baseTextX = pos.x + (size.x - textSize.x) / 2.0f;
              float textY = pos.y + (size.y - textSize.y) / 2.0f;

              // Hiệu ứng trượt mượt hơn với DeltaTime
              static float textOffset = 0.0f;
              float targetOffset = bua ? 5.0f : 0.0f;
              float speed = 12.0f;  // tốc độ mượt, càng cao càng nhanh
              float deltaTime = ImGui::GetIO().DeltaTime;
              textOffset += (targetOffset - textOffset) * speed * deltaTime;

              float textX = baseTextX + textOffset;
              draw_list->AddText(ImVec2(textX, textY), IM_COL32(255, 255, 255, 255), label);

              if (bua) {
                ImGui::SetWindowFontScale(2.1f);
                draw_list->AddText(ImVec2(textX - 20.0f, textY - 4.0f), IM_COL32(255, 255, 255, 255), "~ ");
              }
            }
            ImGui::SameLine();
            {
              ImVec2 pos = ImVec2(windowPos.x + 260.0f, windowPos.y + 290.0f);
              ImGui::SetCursorScreenPos(pos);

              ImVec2 size = ImVec2(160.0f, 35.0f);
              ImVec2 end = ImVec2(pos.x + size.x, pos.y + size.y);

              ImDrawList *draw_list = ImGui::GetWindowDrawList();

              // Invisible button để bật/tắt
              if (ImGui::InvisibleButton("rongta", size)) {
                rongta = !rongta;
              }

              // Màu nền
              ImU32 bgColor = rongta ? IM_COL32(255, 86, 102, 255) : IM_COL32(40, 40, 45, 255);
              draw_list->AddRectFilled(pos, end, bgColor, 15.0f);

              // Căn giữa text
              ImGui::SetWindowFontScale(1.3f);
              const char *label = "RỒNG / TÀ THẦN";
              ImVec2 textSize = ImGui::CalcTextSize(label);
              float baseTextX = pos.x + (size.x - textSize.x) / 2.0f;
              float textY = pos.y + (size.y - textSize.y) / 2.0f;

              // Hiệu ứng trượt mượt hơn với DeltaTime
              static float textOffset = 0.0f;
              float targetOffset = rongta ? 5.0f : 0.0f;
              float speed = 12.0f;  // tốc độ mượt, càng cao càng nhanh
              float deltaTime = ImGui::GetIO().DeltaTime;
              textOffset += (targetOffset - textOffset) * speed * deltaTime;

              float textX = baseTextX + textOffset;
              draw_list->AddText(ImVec2(textX, textY), IM_COL32(255, 255, 255, 255), label);

              if (rongta) {
                ImGui::SetWindowFontScale(2.1f);
                draw_list->AddText(ImVec2(textX - 20.0f, textY - 4.0f), IM_COL32(255, 255, 255, 255), "~ ");
              }
            }
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 275.0f, windowPos.y + 335.0f));
            ImGui::SetWindowFontScale(1.5f);
            Checkbox(AutoLose, "Auto Lose", "Phá Trụ Đội Mình Ngay Lập Tức", self.italic);
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 335.0f));
            ImGui::SetWindowFontScale(1.5f);
            Checkbox(AutoWin, "Auto Win", "Phá Trụ Đối Thủ Ngay Lập Tức", self.italic);
          }
          if (bandotab) {
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 117.0f));
            if (DrawToggleBoxdaihon("Auto Bán Đồ", "Tự Động Bán Đồ Trong 0.3 Giây", "bandoToggle", bandotab, self.italic, self.icon131)) {
              macrotab = false;
              botrotab = false;
              bandotab = true;
            }
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 177.0f));
            ImGui::SetWindowFontScale(1.5f);
            ImGui::TextColored(ImVec4(1.0f, 0.34f, 0.4f, 1.0f), " TỰ ĐỘNG MUA / BÁN ĐỒ NHANH || 0.3 GIÂY ");
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 197.0f));
            ImGui::SetWindowFontScale(1.15f);
            ImGui::Text(
                "HDSD | CHỈ HOẠT ĐỘNG VỚI FULL LAYOUT NẰM 1 BÊN\nCÀI "
                "ĐẶT > THIẾT LẬP GIAO DIỆN > HIỂN TRỊ TRANG BỊ + VỊ "
                "TRÍ SHOP\nLƯU Ý | ĐỒ CẦN BÁN PHẢI ĐỂ SLOT THỨ 6 \n VÀ "
                "ĐỒ CẦN MUA PHẢI ĐƯỢC SOẠN TRƯỚC");
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 260.0f));
            if (DrawToggleBox("Layout Trái", "Full Trái", "bandotraiToggle", autobando, self.italic, self.icon131)) {
              autobando = !autobando;
            }
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 265.0f, windowPos.y + 260.0f));
            if (DrawToggleBox("Layout Phải", "Full Phải", "bandoPhaiToggle", autobandobenphai, self.italic, self.icon131)) {
              autobandobenphai = !autobandobenphai;
            }
          }
          if (macrotab) {
          }
          {
            ImVec2 btnClosePos = ImVec2(windowPos.x + 500, windowPos.y + 256);
            ImVec2 btnSize = ImVec2(155, 48);

            ImGui::SetCursorScreenPos(btnClosePos);
            if (ImGui::InvisibleButton("openmain", btnSize)) {
              Settings::Tab = 1;
            }

            draw->AddRect(btnClosePos, btnClosePos + btnSize, IM_COL32(255, 255, 255, 0), 10.0f);
            draw->AddText(btnClosePos + ImVec2(50, 15), IM_COL32(255, 255, 255, 0), "openmain");
          }
        } else if (Settings::Tab == 4) {
          // // hang 1
          // if (minimaptab) {
          //   ImGui::SetWindowFontScale(1.2f);
          //   ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 65.0f));
          //   ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(12, 12));
          //   ImGui::PushStyleVar(ImGuiStyleVar_GrabMinSize, 30);
          //   ImGui::PushStyleVar(ImGuiStyleVar_GrabRounding, 10);
          //   ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 10);
          //   ImGui::SetNextItemWidth(300);

          //   if (ImGui::SliderFloat("##minimapngang", &minimapPos.x, 0.0f, 200.0f, "Minimap Ngang: %.2f m")) {
          //     saveFloatState(kMinimapPosXKey, minimapPos.x);
          //   }
          //   ImGui::SetNextItemWidth(300);
          //   ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 105.0f));
          //   if (ImGui::SliderFloat("##minimapdoc", &minimapPos.y, 0.0f, 200.0f, "Minimap Dọc: %.2f m")) {
          //     saveFloatState(kMinimapPosYKey, minimapPos.y);
          //   }
          //   ImGui::SetNextItemWidth(300);
          //   ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 145.0f));
          //   if (ImGui::SliderFloat("##minimapRotation", &minimapRotation, -180.0f, 180.0f, "Xoay MiniMap: %.1f Độ")) {
          //     saveFloatState(kMinimapRotationKey, minimapRotation);
          //   }
          //   ImGui::SetNextItemWidth(300);
          //   ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 185.0f));
          //   if (ImGui::SliderFloat("##iconScale", &iconScale, 0.1f, 5.0f, "Kích Thước Icon: %.2f")) {
          //     saveFloatState(kIconScaleKey, iconScale);
          //   }
          //   ImGui::SetNextItemWidth(300);
          //   ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 225.0f));
          //   if (ImGui::SliderFloat("##minimapScale", &minimapScale, 0.1f, 2.0f, "Kích Thước MiniMap %.2f")) {
          //     saveFloatState(kMinimapScaleKey, minimapScale);
          //   }
          //   if (minimapType != previousMinimapType) {
          //     if (minimapType == 1) {
          //       // Quay lại giá trị ban đầu khi chọn Team Blue
          //       minimapRotation -= 180.0f;
          //     } else if (minimapType == 2) {
          //       // Tăng thêm 180 độ khi chọn Team Red
          //       minimapRotation += 180.0f;
          //     }
          //     // Cập nhật lại giá trị trước đó
          //     previousMinimapType = minimapType;
          //   }

          //   ImGui::PopStyleVar(4);
          // } else {
          //   ImGui::SetWindowFontScale(1.5f);
          //   ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 240.0f, windowPos.y + 57.0f));
          //   Checkbox(IgnoreInvisible, "Bỏ Qua Khi Thấy", "Không Vẽ Khi Có Tầm Nhìn", self.italic);
          //   ImGui::SetWindowFontScale(1.5f);
          //   ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 240.0f, windowPos.y + 97.0f));
          //   if (Checkbox(ESPCount, "Number", "Khung Đếm Số Địch", self.italic)) {
          //     saveState(NumState, ESPCount);
          //   }
          //   ImGui::SetWindowFontScale(1.5f);
          //   ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 240.0f, windowPos.y + 137.0f));
          //   if (Checkbox(PlayerLine, "Line", "Đường Kẻ Địch", self.italic)) {
          //     saveState(lineState, PlayerLine);
          //   }
          //   ImGui::SetWindowFontScale(1.5f);
          //   ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 240.0f, windowPos.y + 177.0f));
          //   if (Checkbox(PlayerDistance, "Distance", "Khoảng Cách Địch", self.italic)) {
          //     saveState(disState, PlayerDistance);
          //   }

          //   // hang 5

          //   ImGui::SetWindowFontScale(1.5f);
          //   ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 240.0f, windowPos.y + 202.0f + 15.0f));
          //   if (Checkbox(showMinimap, "Hero Icon", "Hiển Thị Icon Tướng", self.italic)) {
          //     saveState(miniState, showMinimap);
          //   }
          //   ImGui::SetWindowFontScale(1.5f);
          //   ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 177.0f));
          //   if (Checkbox(Boxx, "Box", "Hộp Bao Quanh Địch", self.italic)) {
          //     saveState(boxState, Boxx);
          //   }
          //   ImGui::SetWindowFontScale(1.5f);
          //   ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 202.0f + 15.0f));
          //   if (Checkbox(DrawBigDot, "MiniMap", "Hiển Thị Lên MiniMap", self.italic)) {
          //     saveState(iconState, DrawBigDot);
          //   }
          //   ImGui::SetWindowFontScale(1.5f);

          //   ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 57.0f));
          //   Checkbox(ESPEnable, "Bật ESP", "Bắt Đầu Vẽ ESP", self.italic);

          //   // hang 2
          //   ImGui::SetWindowFontScale(1.5f);
          //   ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 97.0f));
          //   if (Checkbox(PlayerName, "Info Player", "Thông Tin Địch", self.italic)) {
          //     saveState(InfoState, PlayerName);
          //   }

          //   // hang 3
          //   ImGui::SetWindowFontScale(1.5f);
          //   ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 137.0f));
          //   if (Checkbox(Alert360, "Alert 360", "Cảnh Báo Xung Quanh", self.italic)) {
          //     saveState(alertState, Alert360);
          //   }

          //   // hang 4

          //   ImGui::SetWindowFontScale(1.5f);
          //   ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 240.0f + 17.0f));
          //   ImGui::SetWindowFontScale(1.5f);
          //   Checkbox(StreamerMode, "Ẩn Esp & Menu Khi Quay Chụp",
          //            "Không hiện bất cứ thứ gì lên màn hình khi chụp bằng chức "
          //            "năng này",
          //            self.italic);
          // }
          // // Checkbox(minimaptab, "abc", "Không hiện bất cứ thứ gì lên màn hình
          // // khi chụp bằng chức năng này", self.italic);
          // ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 280.0f + 20.0f));

          // if (DrawToggleBoxdaihon("Tuỳ Chỉnh Minimap", "Chỉnh Độ Lệch MiniMap", "minimapToggle", minimaptab, self.italic, self.icon131)) {
          //   minimaptab = !minimaptab;
          // }
          // {
          //   ImVec2 btnClosePos = ImVec2(windowPos.x + 500, windowPos.y + 256);
          //   ImVec2 btnSize = ImVec2(155, 48);

          //   ImGui::SetCursorScreenPos(btnClosePos);
          //   if (ImGui::InvisibleButton("openmain", btnSize)) {
          //     Settings::Tab = 1;
          //   }

          //   draw->AddRect(btnClosePos, btnClosePos + btnSize, IM_COL32(255, 255, 255, 0), 10.0f);
          //   draw->AddText(btnClosePos + ImVec2(50, 15), IM_COL32(255, 255, 255, 0), "openmain");
          // }
        } else if (Settings::Tab == 5) {
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 95.5f, windowPos.y + 58.5f));
          if (DrawToggleBoxdaihon2("MOD MEMORY", "Mod Nút | TB Hạ | Rank", "modtab1Toggle", modtab1, self.italic, self.icon131)) {
            modtab2 = false;
            modtab1 = true;
          }
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 254.5f + 40.0f, windowPos.y + 58.5f));
          if (DrawToggleBox("MOD KHÁC", "Mod File ...", "modtab2Toggle", modtab2, self.italic, self.icon131)) {
            modtab1 = false;
            modtab2 = true;
          }
          if (modtab1) {
            {
              ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 57.0f + 60.0f));
              ImGui::SetNextItemWidth(220);
              ImGui::SetWindowFontScale(1.2f);
              ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(11.5, 11.5));
              Killnottify();
              ImGui::PopStyleVar();
            }

            {
              ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 98.5f + 60.0f));
              ImGui::SetNextItemWidth(220);
              ImGui::SetWindowFontScale(1.2f);
              ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(11.5, 11.5));
              Skinbutton();
              ImGui::PopStyleVar();
            }
            {
              ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 210.0f + 17.66f, windowPos.y + 140.0f + 60.0f));
              ImGui::SetNextItemWidth(220);
              ImGui::SetWindowFontScale(1.2f);
              ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(11.5, 11.5));
              Skinsoldier();
              // ImVec2 old_spacing3 = ImGui::GetStyle().ItemSpacing;
              // ImGui::GetStyle().ItemSpacing.y = 6.0f;
              // if (ImGui::BeginCombo("##RANK", options3[selectedValue3])) {
              //   const float top_bottom_padding = 5.0f;           // Padding mép trên/dưới
              //   ImGui::Dummy(ImVec2(0.0f, top_bottom_padding));  // Padding trên
              //   for (int j = 0; j < IM_ARRAYSIZE(options3); j++) {
              //     bool isSelected = (selectedValue3 == j);
              //     if (ImGui::Selectable(options3[j], isSelected)) {
              //       selectedValue3 = j;
              //       switch (selectedValue3) {
              //         case 9:
              //           pro5rank = 1;
              //           soluongsao = 1;
              //           toptd = 0;
              //           thachdau = false;
              //           rankthuong3s = true;
              //           rankchienthan = rankchientuong = rankcaothu = rankthuong5s = rankthuong4s = false;
              //           break;
              //         case 8:
              //           pro5rank = 5;
              //           soluongsao = 1;
              //           toptd = 0;
              //           thachdau = false;
              //           rankthuong4s = true;
              //           rankchienthan = rankchientuong = rankcaothu = rankthuong5s = rankthuong3s = false;
              //           break;
              //         case 7:
              //           pro5rank = 17;
              //           soluongsao = 1;
              //           toptd = 0;
              //           thachdau = false;
              //           rankthuong4s = true;
              //           rankchienthan = rankchientuong = rankcaothu = rankthuong5s = rankthuong3s = false;
              //           break;
              //         case 6:
              //           pro5rank = 19;
              //           soluongsao = 1;
              //           toptd = 0;
              //           thachdau = false;
              //           rankthuong5s = true;
              //           rankchienthan = rankchientuong = rankcaothu = rankthuong4s = rankthuong3s = false;
              //           break;
              //         case 5:
              //           pro5rank = 21;
              //           soluongsao = 1;
              //           toptd = 0;
              //           thachdau = false;
              //           rankthuong5s = true;
              //           rankchienthan = rankchientuong = rankcaothu = rankthuong4s = rankthuong3s = false;
              //           break;
              //         case 4:
              //           pro5rank = 26;
              //           soluongsao = 1;
              //           toptd = 0;
              //           thachdau = false;
              //           rankthuong5s = true;
              //           rankchienthan = rankchientuong = rankcaothu = rankthuong4s = rankthuong3s = false;
              //           break;
              //         case 3:
              //           pro5rank = 16;
              //           soluongsao = 1;
              //           toptd = 0;
              //           thachdau = false;
              //           rankcaothu = true;
              //           rankchienthan = rankchientuong = rankthuong5s = rankthuong4s = rankthuong3s = false;
              //           break;
              //         case 2:
              //           pro5rank = 31;
              //           soluongsao = 51;
              //           toptd = 0;
              //           thachdau = false;
              //           rankchientuong = true;
              //           rankchienthan = rankcaothu = rankthuong5s = rankthuong4s = rankthuong3s = false;
              //           break;
              //         case 1:
              //           pro5rank = 32;
              //           soluongsao = 100;
              //           toptd = 0;
              //           thachdau = false;
              //           rankchienthan = true;
              //           rankchientuong = rankcaothu = rankthuong5s = rankthuong4s = rankthuong3s = false;
              //           break;
              //         case 0:
              //           pro5rank = 32;
              //           soluongsao = 100;
              //           toptd = 1;
              //           thachdau = true;
              //           rankchienthan = true;
              //           rankchientuong = rankcaothu = rankthuong5s = rankthuong4s = rankthuong3s = false;
              //           break;
              //         default:
              //           break;
              //       }
              //     }
              //     if (isSelected) {
              //       ImGui::SetItemDefaultFocus();
              //     }
              //   }
              //   ImGui::Dummy(ImVec2(0.0f, top_bottom_padding));  // Padding dưới
              //   ImGui::EndCombo();
              // }
              // ImGui::GetStyle().ItemSpacing = old_spacing3;  // Restore lại spacing

              ImGui::PopStyleVar();
            }

            // ImGui::SetWindowFontScale(1.5f);
            // ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 140.0f + 60.0f));
            // Checkbox(modpro5, "Mod Rank", "Fake Rank & Top", self.italic);

            // ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 181.0f + 60.0f));
            // ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(11.5, 11.5));
            // ImGui::PushStyleVar(ImGuiStyleVar_GrabMinSize, 35);
            // ImGui::PushStyleVar(ImGuiStyleVar_GrabRounding, 10);
            // ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 10);

            // if (modpro5) {
            //   ImGui::SetNextItemWidth(170.0f);
            //   if (ImGui::SliderInt("##rankcuc", &rankcuc, 1, 100, "Top Thứ %.0f")) {
            //     TriggerHapticFeedback();
            //   }
            //   ImGui::SameLine();
            //   ImGui::SetNextItemWidth(170.0f);
            //   ImVec2 old_spacing = ImGui::GetStyle().ItemSpacing;
            //   ImGui::GetStyle().ItemSpacing.y = 6.0f;
            //   if (ImGui::BeginCombo("Danh Hiệu", options4[selectedValue4])) {
            //     const float top_bottom_padding = 5.0f;           // Padding mép trên/dưới
            //     ImGui::Dummy(ImVec2(0.0f, top_bottom_padding));  // Padding trên
            //     for (int j = 0; j < IM_ARRAYSIZE(options4); j++) {
            //       bool isSelected = (selectedValue4 == j);
            //       if (ImGui::Selectable(options4[j], isSelected)) {
            //         selectedValue4 = j;
            //         switch (selectedValue4) {
            //           case 0:
            //             maucuc = 6;
            //             pro5maucuc = 1;
            //             break;
            //           case 1:
            //             maucuc = 5;
            //             pro5maucuc = 1;
            //             break;
            //           case 2:
            //             maucuc = 4;
            //             pro5maucuc = 0;
            //             break;
            //           case 3:
            //             maucuc = 3;
            //             pro5maucuc = 0;
            //             break;
            //           case 4:
            //             maucuc = 2;
            //             pro5maucuc = 0;
            //             break;
            //           case 5:
            //             maucuc = 1;
            //             pro5maucuc = 0;
            //             break;
            //           case 6:
            //             maucuc = 0;
            //             pro5maucuc = 0;
            //             break;
            //           default:
            //             break;
            //         }
            //       }
            //       if (isSelected) {
            //         ImGui::SetItemDefaultFocus();
            //       }
            //     }
            //     ImGui::Dummy(ImVec2(0.0f, top_bottom_padding));  // Padding dưới
            //     ImGui::EndCombo();
            //   }
            //   ImGui::GetStyle().ItemSpacing = old_spacing;  // Restore lại spacing

            //   ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 220.0f + 60.0f));

            //   ImGui::PushItemWidth(thachdau ? 170.0f : 350.0f);
            //   if (rankcaothu && modpro5) {
            //     if (ImGui::SliderInt("##sls", &soluongsao, 1, 49, "Số lượng sao %.0f")) {
            //       TriggerHapticFeedback();
            //     }
            //   } else if (rankchientuong && modpro5) {
            //     if (ImGui::SliderInt("##sls", &soluongsao, 50, 99, "Số lượng sao %.0f")) {
            //       TriggerHapticFeedback();
            //     }
            //   } else if (rankchienthan && modpro5) {
            //     if (ImGui::SliderInt("##sls", &soluongsao, 100, 500, "Số lượng sao %.0f")) {
            //       TriggerHapticFeedback();
            //     }
            //   } else if (rankthuong5s && modpro5) {
            //     if (ImGui::SliderInt("##sls", &soluongsao, 0, 5, "Số lượng sao %.0f")) {
            //       TriggerHapticFeedback();
            //     }
            //   } else if (rankthuong4s && modpro5) {
            //     if (ImGui::SliderInt("##sls", &soluongsao, 0, 4, "Số lượng sao %.0f")) {
            //       TriggerHapticFeedback();
            //     }
            //   } else if (rankthuong3s && modpro5) {
            //     if (ImGui::SliderInt("##sls", &soluongsao, 0, 3, "Số lượng sao %.0f")) {
            //       TriggerHapticFeedback();
            //     }
            //   }

            //   if (thachdau) {
            //     ImGui::SameLine();
            //     if (ImGui::SliderInt("##toptd", &toptd, 1, 50, "TOP THÁCH ĐẤU %.0f")) {
            //       TriggerHapticFeedback();
            //     }
            //   }
            //   ImGui::PopItemWidth();
            //   ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 220.0f + 60.0f + 38.5f));

            //   ImGui::SetNextItemWidth(350);

            //   if (ImGui::SliderInt("##dauan", &dauan, 0, 50, "Dấu Ấn Truyền Kì %.0f")) {
            //     TriggerHapticFeedback();
            //   }
            // }
            // ImGui::Spacing();
            // ImGui::Spacing();
            // ImGui::PopStyleVar(4);
          }
          if (modtab2) {
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 57.0f + 60.0f));
            if (DrawAimbotBoxdaihon("MODSKIN FILE", "Mod Qua File / Link", self.italic, self.icon131, "modfilelink")) {
              thongbaomodskin = true;
              TriggerHapticFeedback();
            }

            if (thongbaomodskin) {
              ImGui::SetNextWindowPos(ImVec2((kWidth - width) / 2, (kHeight - height) / 2), ImGuiCond_FirstUseEver);
              ImGui::SetNextWindowSize(ImVec2(width, height), ImGuiCond_FirstUseEver);
              ImGui::SetNextWindowBgAlpha(0.0f);  // Hoàn toàn trong suốt

              ImGui::Begin("##block_input", nullptr, ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoMove);
              ImGui::End();
              ImDrawList *fg = ImGui::GetForegroundDrawList();
              ImVec2 screen_min = ImGui::GetMainViewport()->Pos;
              ImVec2 screen_max = screen_min + ImGui::GetMainViewport()->Size;
              // Blur background
              fg->AddRectFilled(screen_min, screen_max, IM_COL32(0, 0, 5, 210));
              
              ImVec2 rect_size = ImVec2(400, 200);
              ImVec2 center = ImGui::GetMainViewport()->GetCenter();
              ImVec2 rect_min = center - rect_size * 0.5f;
              ImVec2 rect_max = rect_min + rect_size;

              // Vẽ nền glassmorphism
              fg->AddRectFilled(rect_min, rect_max, IM_COL32(20, 20, 25, 240), 20.0f);
              fg->AddRect(rect_min, rect_max, IM_COL32(255, 86, 102, 100), 20.0f, 0, 2.0f);

              if (thongbao) {
                fg->AddImage((__bridge void *)thongbao, rect_min, rect_max);
              }
              
              ImGui::SetWindowFontScale(3.5f);
              ImVec2 text1_pos = rect_min + ImVec2(25, 20);
              fg->AddText(text1_pos, IM_COL32(255, 86, 102, 255), "THÔNG BÁO");
              
              ImGui::SetWindowFontScale(1.3f);
              ImVec2 text2_pos = rect_min + ImVec2(25, 70);
              fg->AddText(text2_pos, IM_COL32(220, 220, 220, 255),
                          "TRƯỚC KHI BẮT ĐẦU MOD:\n"
                          "Vui lòng thoát game và vào lại để làm mới dữ liệu.\n"
                          "Sau đó nhấn vào [MOD NGAY] ở bên dưới.\n");
              
              // Nút cancel
              ImVec2 btn1_pos = rect_min + ImVec2(25, 145);
              ImVec2 btn_size = ImVec2(120, 35);
              ImVec2 btn2_pos = btn1_pos + ImVec2(120 + 15, 0);
              
              ImU32 btn_color = IM_COL32(255, 86, 102, 255);
              fg->AddRectFilled(btn1_pos, btn1_pos + btn_size, btn_color, 10.0f);
              const char *text1 = "ĐÓNG";
              ImVec2 text1_size = ImGui::CalcTextSize(text1);
              ImVec2 text1_poss = btn1_pos + (btn_size - text1_size) * 0.5f;
              fg->AddText(text1_poss, IM_COL32_WHITE, text1);
              
              fg->AddRectFilled(btn2_pos, btn2_pos + btn_size, btn_color, 10.0f);
              const char *text2 = "MOD NGAY";
              ImVec2 text2_size = ImGui::CalcTextSize(text2);
              ImVec2 text2_poss = btn2_pos + (btn_size - text2_size) * 0.5f;
              fg->AddText(text2_poss, IM_COL32_WHITE, text2);
              
              // Xử lý click thủ công
              ImVec2 mouse = ImGui::GetIO().MousePos;
              bool click = ImGui::IsMouseClicked(0);
              if (click && ImGui::IsMouseHoveringRect(btn1_pos, btn1_pos + btn_size)) {
                thongbaomodskin = false;
                TriggerHapticFeedback();
              }
              if (click && ImGui::IsMouseHoveringRect(btn2_pos, btn2_pos + btn_size)) {
                ModSkin();
                TriggerHapticFeedback();
                thongbaomodskin = false;
              }
            }

            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 57.0f + 120.0f - 5.0f));
            if (DrawAimbotBoxdaihon("XOÁ MOD", "Xoá Mod / Xoá Cập Nhật ( Resources )", self.italic, self.icon131, "Xoamod")) {
              MenDeal = false;

              UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"XOÁ MOD SKIN ?" message:nil preferredStyle:UIAlertControllerStyleAlert];
              UIAlertAction *clear = [UIAlertAction actionWithTitle:@"XOÁ MOD SKIN"
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction *_Nonnull action) {
                                                              [ModSkinDSGM RemoveModDSGM];
                                                            }];

              UIAlertAction *force = [UIAlertAction actionWithTitle:@"FORCE UPDATE"
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction *_Nonnull action) {
                                                              [[maintool sharemain] xoamod];
                                                            }];

              UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
              [alert addAction:clear];
              [alert addAction:force];
              [alert addAction:okAction];

              UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
              [viewController presentViewController:alert animated:YES completion:nil];
              TriggerHapticFeedback();
            }
            ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f, windowPos.y + 57.0f + 180.0f - 10.0f));
            if (DrawAimbotBoxdaihon("SAVE ACCOUNT", "Chức Năng Hữu Ích Cho Ai Nhiều Acc", self.italic, self.icon131, "SaveAcc")) {
              MenDeal = false;

              [[maintool sharemain] LoadAcc];

              [[maintool sharemain] ChangeAccount];
              TriggerHapticFeedback();
            }
            // ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.0f,
            // windowPos.y + 57.0f + 240.0f));
            ImVec2 pos = ImVec2(windowPos.x + 100.0f, windowPos.y + 57.0f + 240.0f - 15.0f);
            ImVec2 size = ImVec2(350.0f, 40.0f);
            ImVec2 end = ImVec2(pos.x + size.x, pos.y + size.y);

            ImDrawList *draw_list = ImGui::GetWindowDrawList();

            // Invisible button để bật/tắt
            ImGui::SetCursorScreenPos(pos);
            if (ImGui::InvisibleButton("doiten", size)) {
              doiten = !doiten;
              MenDeal = false;
              if (doiten) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"LƯU Ý"
                                                                               message:
                                                                                   @"Sau khi nhập tên thì hãy nhấn "
                                                                                   @"lại chức năng để đổi lại sang "
                                                                                   @"màu đỏ này rồi nhấn đổi để đổi "
                                                                                   @"tên thành công"
                                                                        preferredStyle:UIAlertControllerStyleAlert];
                UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
                UIViewController *rootVC = keyWindow.rootViewController;
                [rootVC presentViewController:alert animated:YES completion:nil];
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [alert addAction:okAction];
              }
            }

            // Màu nền
            ImU32 bgColor = doiten ? IM_COL32(255, 86, 102, 255) : IM_COL32(40, 40, 45, 255);
            draw_list->AddRectFilled(pos, end, bgColor, 15.0f);

            // Căn giữa text
            ImGui::SetWindowFontScale(1.4f);
            const char *label = "ĐỔI TÊN DÀI ( TÊN ACCOUNT )";
            ImVec2 textSize = ImGui::CalcTextSize(label);
            float baseTextX = pos.x + (size.x - textSize.x) / 2.0f;
            float textY = pos.y + (size.y - textSize.y) / 2.0f;

            // Hiệu ứng trượt mượt hơn với DeltaTime
            static float textOffset = 0.0f;
            float targetOffset = doiten ? 5.0f : 0.0f;
            float speed = 12.0f;  // tốc độ mượt, càng cao càng nhanh
            float deltaTime = ImGui::GetIO().DeltaTime;
            textOffset += (targetOffset - textOffset) * speed * deltaTime;

            float textX = baseTextX + textOffset;
            draw_list->AddText(ImVec2(textX, textY), IM_COL32(255, 255, 255, 255), label);

            if (doiten) {
              ImGui::SetWindowFontScale(2.1f);
              draw_list->AddText(ImVec2(textX - 20.0f, textY - 4.0f), IM_COL32(255, 255, 255, 255), "~ ");
            }
          }

        } else if (Settings::Tab == 6) {
                  ImDrawList *draw_list = ImGui::GetWindowDrawList();
          {
            ImVec2 btnOpenPos = ImVec2(windowPos.x + 93, windowPos.y + 55);
            ImVec2 btnSize = ImVec2(187, 55);

            ImGui::SetCursorScreenPos(btnOpenPos);
            if (ImGui::InvisibleButton("btn_open", btnSize)) {
            }

            // Tuỳ chọn: vẽ viền hoặc highlight để bạn dễ thấy button
            draw_list->AddRect(btnOpenPos, btnOpenPos + btnSize, IM_COL32(255, 255, 255, 0), 10.0f);
            draw_list->AddText(btnOpenPos + ImVec2(55, 15), IM_COL32(255, 255, 255, 0), "OPEN");
          }

          // Button "CLOSE"
          {
            ImVec2 btnClosePos = ImVec2(windowPos.x + 287, windowPos.y + 55);
            ImVec2 btnSize = ImVec2(187, 55);

            ImGui::SetCursorScreenPos(btnClosePos);
            if (ImGui::InvisibleButton("btn_close", btnSize)) {
              MenDeal = false;

              [[maintool sharemain] openAppDirectory];
            }

            draw_list->AddRect(btnClosePos, btnClosePos + btnSize, IM_COL32(255, 255, 255, 0), 10.0f);
            draw_list->AddText(btnClosePos + ImVec2(50, 15), IM_COL32(255, 255, 255, 0), "CLOSE");
          }
          ImGui::SetWindowFontScale(1.5f);
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 92.0f, windowPos.y + 275.0f));
          if (Checkbox(ANICON, "ẨN ICON TRÊN MÀN HÌNH", "CHẠM 3 NGÓN 3 LẦN ĐỂ MỞ LẠI MENU NẾU BỊ ẨN", self.italic)) {
            saveStateBool(kANICONStateKey, ANICON);
            MenuLoad *menuLoadInstance = [MenuLoad createInstance];
            [menuLoadInstance hidemenuBtn];
          }

        } else if (Settings::Tab == 7) {
          ImGui::SetWindowFontScale(1.5f);

          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.5f, windowPos.y + 146.5f + 5.0f));

          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 275.5f, windowPos.y + 185.5f + 5.0f));
          ImGui::SetWindowFontScale(1.5f);
          Checkbox(spamchat, "Spam Chat x10", "Chat Liên Tục 10 Lần", self.italic);
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.5f, windowPos.y + 185.5f + 5.0f));
          ImGui::SetWindowFontScale(1.5f);
          Checkbox(balo, "Bán Đồ Trong Balo", "Mỗi Món Giá 1 Vàng", self.italic);

          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.5f, windowPos.y + 225.5f + 5.0f));
          ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(1.0f, 0.34f, 0.4f, 1.0f));
          ImGui::SetWindowFontScale(1.65f);
          ImGui::Text("CHỨC NĂNG GIẢI TRÍ");
          ImGui::SameLine();
          ImGui::PopStyleColor();
          ImGui::Text("CHƠI VỚI BOT");
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 275.5f, windowPos.y + 286.5f + 5.0f));
          ImGui::SetWindowFontScale(1.5f);
          Checkbox(tkms, "Buff Nổ", "Không Được Lạm Dụng !!!", self.italic);
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 275.5f, windowPos.y + 245.5f + 5.0f));
          ImGui::SetWindowFontScale(1.5f);
          Checkbox(autowin, "Auto Win", "Vào Game Tự Win", self.italic);
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.5f, windowPos.y + 245.5f + 5.0f));
          ImGui::SetWindowFontScale(1.5f);
          Checkbox(nocd, "Không Hồi Chiêu", "Xả Chiêu Thoải Mái", self.italic);
          ImGui::SetCursorScreenPos(ImVec2(windowPos.x + 100.5f, windowPos.y + 286.5f + 5.0f));
          ImGui::SetWindowFontScale(1.5f);
          Checkbox(onehit, "1 Đấm 1 Mạng ", "Dame Gây Ra Là 99999999", self.italic);
        }
        ImGui::PopStyleVar();  // Pop the WindowBg color
      }
      const ImVec2 pos = ImGui::GetWindowPos();

      ImDrawList *draw_list = ImGui::GetWindowDrawList();
      ImDrawList *backdraw = ImGui::GetBackgroundDrawList();
      backdraw->AddRectFilled(ImVec2(0, 0), ImGui::GetIO().DisplaySize, IM_COL32(0, 0, 0, 150)  // màu đen mờ
      );
      ImGui::End();

      switch (box) {
        case 0:
          PlayerBox = true;
          ESP3DBox = false;

          break;
        case 1:
          PlayerBox = false;
          ESP3DBox = true;
          break;
        case 2:
          PlayerBox = true;
          ESP3DBox = false;
          break;
      }
    }
    ImDrawList *draw_list = ImGui::GetBackgroundDrawList();
    DrawESP(draw_list);
    if (ESPEnable) {
      if (ESPCount && ESPEnable) {
        ImU32 backgroundColor = (aiCount == 0 && playerCount == 0) ? IM_COL32(0, 255, 0, 150) : IM_COL32(255, 0, 0, 150);
        ImU32 borderColor = (aiCount == 0 && playerCount == 0) ? IM_COL32(0, 255, 0, 255) : IM_COL32(255, 0, 0, 255);

        std::string countDisplay = std::to_string(aiCount) + " | " + std::to_string(playerCount);
        auto textSize = ImGui::CalcTextSize(countDisplay.c_str());

        float paddingX = 10.0f;
        float paddingY = 2.0f;

        ImVec2 topLeft = ImVec2((ImGui::GetIO().DisplaySize.x / 2) - (textSize.x / 2) - paddingX, 38 - textSize.y - paddingY);
        ImVec2 bottomRight = ImVec2((ImGui::GetIO().DisplaySize.x / 2) + (textSize.x / 2) + paddingX, 38 + paddingY);

        draw_list->AddRectFilled(topLeft, bottomRight, backgroundColor, 10.0f);

        draw_list->AddRect(topLeft, bottomRight, borderColor, 10.0f);

        draw_list->AddText(ImVec2((topLeft.x + bottomRight.x) / 2 - (textSize.x / 2), topLeft.y + paddingY), IM_COL32(255, 255, 255, 255), countDisplay.c_str());
      }
    }

    ImGuiStyle &style = ImGui::GetStyle();

    ImVec4 *colors = style.Colors;
    colors[ImGuiCol_WindowBg]       = ImVec4(0.08f, 0.08f, 0.10f, 0.95f);
    colors[ImGuiCol_Border]         = ImVec4(1.00f, 0.34f, 0.40f, 0.40f);
    colors[ImGuiCol_FrameBg]        = ImVec4(0.15f, 0.15f, 0.18f, 1.00f);
    colors[ImGuiCol_FrameBgHovered] = ImVec4(0.20f, 0.20f, 0.24f, 1.00f);
    colors[ImGuiCol_FrameBgActive]  = ImVec4(1.00f, 0.34f, 0.40f, 0.60f);
    colors[ImGuiCol_CheckMark]      = ImVec4(1.00f, 1.00f, 1.00f, 1.00f);
    colors[ImGuiCol_SliderGrab]     = ImVec4(1.00f, 0.34f, 0.40f, 1.00f);
    colors[ImGuiCol_SliderGrabActive]= ImVec4(1.00f, 0.45f, 0.50f, 1.00f);
    colors[ImGuiCol_Button]         = ImVec4(0.15f, 0.15f, 0.18f, 1.00f);
    colors[ImGuiCol_ButtonHovered]  = ImVec4(1.00f, 0.34f, 0.40f, 0.80f);
    colors[ImGuiCol_ButtonActive]   = ImVec4(1.00f, 0.34f, 0.40f, 1.00f);
    colors[ImGuiCol_Text]           = ImVec4(0.95f, 0.95f, 0.95f, 1.00f);

    style.ChildRounding = 12.0f;
    style.WindowPadding = ImVec2(-1, -1);
    style.WindowRounding = 20.0f;
    style.FramePadding = ImVec2(12, 8);
    style.FrameRounding = 8.0f;
    style.ScrollbarSize = 20.0f;
    style.ScrollbarRounding = 10.0f;
    style.GrabMinSize = 25.0f;
    style.GrabRounding = 12.0f;
    style.PopupRounding = 12.0f;
    style.Alpha = 1.0f;

    ImGui::Render();
    ImDrawData *draw_data = ImGui::GetDrawData();
    ImGui_ImplMetal_RenderDrawData(draw_data, commandBuffer, renderEncoder);

    [renderEncoder popDebugGroup];
    [renderEncoder endEncoding];

    [commandBuffer presentDrawable:view.currentDrawable];

    if (MapHack) {
      if (map_active == NO) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          // ActiveOff((uint64_t)GET_OFFSET(oxorany("Project.Plugins_d.dll"),
          // oxorany("NucleusDrive.Logic"), oxorany("LVActorLinker"),
          // oxorany("SetVisible"), 3) + 0x18, "360080D2");  // map
          //  Patch((uint64_t)GET_OFFSET(oxorany("Project.Plugins_d.dll"),
          //  oxorany("NucleusDrive.Logic"), oxorany("LVActorLinker"),
          //  oxorany("SetVisible"), 3) + 0x18, "360080D2");
          // ActiveOff((uint64_t)GET_OFFSET(oxorany("Project_d.dll"),
          // oxorany("Assets.Scripts.GameSystem"),
          // oxorany("UIBattleStatView/HeroItem"),
          // oxorany("updateTalentSkillCD"), 1) + 0x21C, "1F2003D5");  // bổ
          // trợ
          dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // Patch((uint64_t)GET_OFFSET(oxorany("Project_d.dll"),
            // oxorany("Assets.Scripts.GameSystem"),
            // oxorany("UIBattleStatView/HeroItem"),
            // oxorany("updateTalentSkillCD"), 1) + 0x21C, "1F2003D5");
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
              // ActiveOff((uint64_t)GET_OFFSET(oxorany("Project_d.dll"),
              // oxorany("Assets.Scripts.GameSystem"),
              // oxorany("PVPLoadingView"), oxorany("OnEnter"), 0) +
              // 0x11F4, "1F2003D5");  // rank
              // Patch((uint64_t)GET_OFFSET(oxorany("Project_d.dll"),
              // oxorany("Assets.Scripts.GameSystem"),
              // oxorany("PVPLoadingView"), oxorany("OnEnter"), 0) +
              // 0x11F4, "1F2003D5");
              HookUnity((uint64_t)GET_OFFSET(oxorany("Project_d.dll"), oxorany("Assets.Scripts.GameSystem"), oxorany("CPlayerProfile"), oxorany("get_IsHostProfile"), 0), rettrue, _rettrue);
            });
          });
        });
      }
      map_active = YES;
    } else {
      if (map_active == YES) {
        // DeActiveOff((uint64_t)GET_OFFSET(oxorany("Project.Plugins_d.dll"),
        // oxorany("NucleusDrive.Logic"), oxorany("LVActorLinker"),
        // oxorany("SetVisible"), 3) + 0x18, "360080D2");
        // DeActiveOff((uint64_t)GET_OFFSET(oxorany("Project_d.dll"),
        // oxorany("Assets.Scripts.GameSystem"),
        // oxorany("UIBattleStatView/HeroItem"), oxorany("updateTalentSkillCD"),
        // 1) + 0x21C, "1F2003D5");
        // DeActiveOff((uint64_t)GET_OFFSET(oxorany("Project_d.dll"),
        // oxorany("Assets.Scripts.GameSystem"), oxorany("PVPLoadingView"),
        // oxorany("OnEnter"), 0) + 0x11F4, "1F2003D5");  // rank
      }
      map_active = NO;
    }

    if (skillcd) {
      if (skill_active == NO) {
        // ActiveOff((uint64_t)GET_OFFSET(oxorany("Project_d.dll"),
        // oxorany("Assets.Scripts.GameSystem"), oxorany("HeroInfoPanel"),
        // oxorany("InitHeroItemData"), 2) + 0x274, "1F2003D5");
        // ActiveOff((uint64_t)GET_OFFSET(oxorany("Project_d.dll"),
        // oxorany("Assets.Scripts.GameSystem"), oxorany("HeroInfoPanel"),
        // oxorany("ShowHeroInfo"), 2) + 0x18, "33008052");
        //  Patch((uint64_t)GET_OFFSET(oxorany("Project_d.dll"),
        //  oxorany("Assets.Scripts.GameSystem"), oxorany("HeroInfoPanel"),
        //  oxorany("InitHeroItemData"), 2) + 0x274, "1F2003D5");
        //  Patch((uint64_t)GET_OFFSET(oxorany("Project_d.dll"),
        //  oxorany("Assets.Scripts.GameSystem"), oxorany("HeroInfoPanel"),
        //  oxorany("ShowHeroInfo"), 2) + 0x18, "33008052");
      }
      skill_active = YES;
    } else {
      if (skill_active == YES) {
        // DeActiveOff((uint64_t)GET_OFFSET(oxorany("Project_d.dll"),
        // oxorany("Assets.Scripts.GameSystem"), oxorany("HeroInfoPanel"),
        // oxorany("InitHeroItemData"), 2) + 0x274, "1F2003D5");
        // DeActiveOff((uint64_t)GET_OFFSET(oxorany("Project_d.dll"),
        // oxorany("Assets.Scripts.GameSystem"), oxorany("HeroInfoPanel"),
        // oxorany("ShowHeroInfo"), 2) + 0x18, "33008052");
      }
      skill_active = NO;
    }

    if (balo) {
      if (balo_active == NO) {
        ActiveOff((uint64_t)GET_OFFSET(oxorany("Project_d.dll"), oxorany("Assets.Scripts.GameSystem"), oxorany("CItem"), oxorany("get_IsCanSell"), 0), "C0035FD6");
        Patch((uint64_t)GET_OFFSET(oxorany("Project_d.dll"), oxorany("Assets.Scripts.GameSystem"), oxorany("CItem"), oxorany("get_IsCanSell"), 0), "C0035FD6");
      }
      balo_active = YES;
    } else {
      if (balo_active == YES) {
        DeActiveOff((uint64_t)GET_OFFSET(oxorany("Project_d.dll"), oxorany("Assets.Scripts.GameSystem"), oxorany("CItem"), oxorany("get_IsCanSell"), 0), "C0035FD6");
      }
      balo_active = NO;
    }

    if (nocd) {
      if (nocd_active == NO) {
        ActiveOff((uint64_t)GET_OFFSET(oxorany("Project.Plugins_d.dll"), oxorany("NucleusDrive.Logic"), oxorany("SkillSlot"), oxorany("StartSkillCD"), 2), "C0035FD6");
        Patch((uint64_t)GET_OFFSET(oxorany("Project.Plugins_d.dll"), oxorany("NucleusDrive.Logic"), oxorany("SkillSlot"), oxorany("StartSkillCD"), 2), "C0035FD6");
      }
      nocd_active = YES;
    } else {
      if (nocd_active == YES) {
        DeActiveOff((uint64_t)GET_OFFSET(oxorany("Project.Plugins_d.dll"), oxorany("NucleusDrive.Logic"), oxorany("SkillSlot"), oxorany("StartSkillCD"), 2), "C0035FD6");
      }
      nocd_active = NO;
    }

    if (onehit) {
      if (onehit_active == NO) {
        ActiveOff((uint64_t)GET_OFFSET(oxorany("Project.Plugins_d.dll"), oxorany("NucleusDrive.Logic"), oxorany("LHurtComponent"), oxorany("SetDamage2ZeroOperatorIfNeed"), 2), "C0035FD6");
        Patch((uint64_t)GET_OFFSET(oxorany("Project.Plugins_d.dll"), oxorany("NucleusDrive.Logic"), oxorany("LHurtComponent"), oxorany("SetDamage2ZeroOperatorIfNeed"), 2), "C0035FD6");
      }
      onehit_active = YES;
    } else {
      if (onehit_active == YES) {
        DeActiveOff((uint64_t)GET_OFFSET(oxorany("Project.Plugins_d.dll"), oxorany("NucleusDrive.Logic"), oxorany("LHurtComponent"), oxorany("SetDamage2ZeroOperatorIfNeed"), 2), "C0035FD6");
      }
      onehit_active = NO;
    }
  }

  [commandBuffer commit];
}

- (void)mtkView:(MTKView *)view drawableSizeWillChange:(CGSize)size {
}

#include "Other/Esp.h"

bool (*_rettrue)(void *instance);
bool rettrue(void *instance) { return true; }

void ModSkin() {
  MenDeal = false;

  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"CHỌN LOẠI MOD BẠN CẦN" message:nil preferredStyle:UIAlertControllerStyleAlert];
  UIAlertAction *clear = [UIAlertAction actionWithTitle:@"MOD SKIN QUA LINK"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction *_Nonnull action) {
                                                  [[maintool sharemain] inputLinkMod];
                                                }];

  UIAlertAction *force = [UIAlertAction actionWithTitle:@"MOD SKIN QUA FILE"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction *_Nonnull action) {
                                                  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"MOD SKIN QUA FILE"
                                                                                                                 message:
                                                                                                                     @"Trước khi mod hãy vuốt về màn hình "
                                                                                                                     @"chính rồi vào lại game để mod"
                                                                                                          preferredStyle:UIAlertControllerStyleAlert];
                                                  UIAlertAction *clear = [UIAlertAction actionWithTitle:@"Mod Ngay"
                                                                                                  style:UIAlertActionStyleDefault
                                                                                                handler:^(UIAlertAction *_Nonnull action) {
                                                                                                  [[maintool sharemain] openFilePicker];
                                                                                                }];

                                                  UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
                                                  [alert addAction:okAction];
                                                  [alert addAction:clear];
                                                  UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
                                                  [viewController presentViewController:alert animated:YES completion:nil];
                                                }];

  UIAlertAction *video = [UIAlertAction actionWithTitle:@"MOD VIDEO SẢNH"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction *_Nonnull action) {
                                                  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Mod Sảnh LQM"
                                                                                                                 message:
                                                                                                                     @"Trước khi mod hãy vuốt về màn hình "
                                                                                                                     @"chính rồi vào lại game để mod"
                                                                                                          preferredStyle:UIAlertControllerStyleAlert];
                                                  UIAlertAction *mod = [UIAlertAction actionWithTitle:@"Mod Ngay"
                                                                                                style:UIAlertActionStyleDefault
                                                                                              handler:^(UIAlertAction *_Nonnull action) {
                                                                                                [[maintool sharemain] modsanhfull];
                                                                                              }];
                                                  UIAlertAction *clear = [UIAlertAction actionWithTitle:@"Reset"
                                                                                                  style:UIAlertActionStyleDefault
                                                                                                handler:^(UIAlertAction *_Nonnull action) {
                                                                                                  [[maintool sharemain] resetsanh];
                                                                                                }];
                                                  UIAlertAction *count = [UIAlertAction actionWithTitle:@"Count"
                                                                                                  style:UIAlertActionStyleDefault
                                                                                                handler:^(UIAlertAction *_Nonnull action) {
                                                                                                  [[maintool sharemain] demsanh];
                                                                                                }];
                                                  UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
                                                  [alert addAction:mod];
                                                  [alert addAction:clear];
                                                  [alert addAction:okAction];

                                                  UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
                                                  [viewController presentViewController:alert animated:YES completion:nil];
                                                }];

  UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
  [alert addAction:clear];
  [alert addAction:force];
  [alert addAction:video];
  [alert addAction:okAction];

  UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
  [viewController presentViewController:alert animated:YES completion:nil];
  TriggerHapticFeedback();
}

@end