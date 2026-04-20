
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

static bool CamSieuXa = false;
static bool Avan = false;
static bool hiensp = false;
static bool hiendanh = false;
static bool SieuFPS = false;
static bool Aimbot = false;
static bool AimbotElsu = false;
static bool AimbotYorn = false;
static bool AimbotJoker = false;
static bool AimbotGrakk = false;
static bool AimbotIggy = false;
static bool AimbotRyoma = false;
static bool AimbotGildur = false;
static bool AimbotRaz = false;
static bool AimbotIllu = false;
static bool AimbotDirak = false;
static bool macrotudong = false;
static bool AutoBocPha = false;
static bool AutoTrungTri = false;
static bool RongTaThan = false;
static bool AutoChoang = false;
static bool AutoQuacam = false;
static bool AutoNhamThach = false;
static bool TuMuaBan = false;

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

// ─── Animation state map for smooth toggle transitions ───────────────────────
static std::map<std::string, float> g_toggleAnim; // 0.0 = OFF, 1.0 = ON

// ─── iOS-style animated Toggle Switch ────────────────────────────────────────
// Draws a beautiful pill-shaped toggle. Returns true when state changed.
bool iOSToggle(bool &flag, const char *label, const char *desc, ImFont *descFont, const char *uid) {
  ImDrawList *dl = ImGui::GetWindowDrawList();
  ImGuiIO &io = ImGui::GetIO();

  // Sizes
  const float W = 52.0f, H = 30.0f;   // pill size
  const float ROW_H = 52.0f;
  ImVec2 rowStart = ImGui::GetCursorScreenPos();
  float fullWidth = ImGui::GetContentRegionAvail().x;

  // Invisible button over entire row
  ImGui::SetCursorScreenPos(rowStart);
  bool clicked = ImGui::InvisibleButton(uid, ImVec2(fullWidth, ROW_H));
  bool hovered = ImGui::IsItemHovered();
  if (clicked) { flag = !flag; TriggerHapticFeedback(); }

  // Row hover highlight
  if (hovered) {
    dl->AddRectFilled(rowStart,
                      ImVec2(rowStart.x + fullWidth, rowStart.y + ROW_H),
                      IM_COL32(255, 255, 255, 10), 12.0f);
  }

  // Separator line at bottom
  dl->AddLine(ImVec2(rowStart.x + 8, rowStart.y + ROW_H - 1),
              ImVec2(rowStart.x + fullWidth - 8, rowStart.y + ROW_H - 1),
              IM_COL32(255, 255, 255, 18));

  // ── Label ──
  ImVec2 textPos = ImVec2(rowStart.x + 14.0f, rowStart.y + 7.0f);
  ImGui::SetCursorScreenPos(textPos);
  ImGui::SetWindowFontScale(1.55f);
  ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(240, 240, 245, 255));
  ImGui::TextUnformatted(label);
  ImGui::PopStyleColor();

  // ── Description ──
  if (descFont && desc && desc[0] != '\0') {
    ImGui::SetCursorScreenPos(ImVec2(textPos.x, textPos.y + 20.0f));
    ImGui::SetWindowFontScale(1.0f);
    ImGui::PushFont(descFont);
    ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(140, 140, 155, 255));
    ImGui::TextUnformatted(desc);
    ImGui::PopStyleColor();
    ImGui::PopFont();
  }

  // ── Animated toggle pill ──
  std::string key = std::string(uid);
  float &t = g_toggleAnim[key];
  float target = flag ? 1.0f : 0.0f;
  float speed = 6.0f;
  if (t < target) t = ImMin(t + io.DeltaTime * speed, target);
  else             t = ImMax(t - io.DeltaTime * speed, target);

  ImVec2 pillPos = ImVec2(rowStart.x + fullWidth - W - 14.0f,
                          rowStart.y + (ROW_H - H) * 0.5f);
  ImVec2 pillEnd = ImVec2(pillPos.x + W, pillPos.y + H);

  // Pill background — interpolate grey → cyan
  ImU32 offColor = IM_COL32(58, 58, 68, 255);
  ImU32 onColor  = IM_COL32(10, 200, 255, 255);
  auto lerpCol = [](ImU32 a, ImU32 b, float f) -> ImU32 {
    float r = ((a >> 0)  & 0xff) + (((b >> 0)  & 0xff) - ((a >> 0)  & 0xff)) * f;
    float g = ((a >> 8)  & 0xff) + (((b >> 8)  & 0xff) - ((a >> 8)  & 0xff)) * f;
    float bl= ((a >> 16) & 0xff) + (((b >> 16) & 0xff) - ((a >> 16) & 0xff)) * f;
    return IM_COL32((int)r, (int)g, (int)bl, 255);
  };
  dl->AddRectFilled(pillPos, pillEnd, lerpCol(offColor, onColor, t), H * 0.5f);

  // Thumb shadow glow when ON
  if (t > 0.01f) {
    dl->AddRectFilled(pillPos, pillEnd,
                      IM_COL32(10, 200, 255, (int)(40 * t)), H * 0.5f);
  }

  // Thumb circle
  float thumbTravel = W - H;
  float thumbX = pillPos.x + 3.0f + thumbTravel * t;
  float thumbY = pillPos.y + H * 0.5f;
  float thumbR = H * 0.5f - 3.0f;
  dl->AddCircleFilled(ImVec2(thumbX + thumbR, thumbY), thumbR, IM_COL32(255, 255, 255, 255), 32);

  ImGui::SetCursorScreenPos(ImVec2(rowStart.x, rowStart.y + ROW_H + 2.0f));
  return clicked;
}

// ─── iOS-style Feature Card (tap to navigate / action) ───────────────────────
bool iOSCard(const char *label, const char *desc, ImFont *descFont, const char *uid, float cardWidth = -1.0f) {
  ImDrawList *dl = ImGui::GetWindowDrawList();
  ImVec2 pos = ImGui::GetCursorScreenPos();
  float w = (cardWidth > 0) ? cardWidth : ImGui::GetContentRegionAvail().x;
  const float H = 56.0f;
  ImVec2 end = ImVec2(pos.x + w, pos.y + H);

  ImGui::SetCursorScreenPos(pos);
  bool clicked = ImGui::InvisibleButton(uid, ImVec2(w, H));
  bool hov = ImGui::IsItemHovered();

  // Card background
  ImU32 bg = hov ? IM_COL32(255, 255, 255, 22) : IM_COL32(255, 255, 255, 11);
  dl->AddRectFilled(pos, end, bg, 14.0f);
  dl->AddRect(pos, end, IM_COL32(255, 255, 255, 28), 14.0f, 0, 1.0f);

  // Label
  ImGui::SetCursorScreenPos(ImVec2(pos.x + 14, pos.y + 9));
  ImGui::SetWindowFontScale(1.55f);
  ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(240, 240, 245, 255));
  ImGui::TextUnformatted(label);
  ImGui::PopStyleColor();

  // Description
  if (descFont && desc && desc[0] != '\0') {
    ImGui::SetCursorScreenPos(ImVec2(pos.x + 14, pos.y + 30));
    ImGui::SetWindowFontScale(1.0f);
    ImGui::PushFont(descFont);
    ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(130, 130, 145, 255));
    ImGui::TextUnformatted(desc);
    ImGui::PopStyleColor();
    ImGui::PopFont();
  }

  // Chevron arrow →
  ImVec2 chevPos = ImVec2(end.x - 22.0f, pos.y + (H - 14.0f) * 0.5f);
  dl->AddText(chevPos, IM_COL32(120, 120, 135, 255), ">");

  if (clicked) TriggerHapticFeedback();
  ImGui::SetCursorScreenPos(ImVec2(pos.x, pos.y + H + 8.0f));
  return clicked;
}

bool Checkbox(bool &funcFlag, const char *funcLabel, const char *funcDescription, ImFont *productSansFont) {
  return iOSToggle(funcFlag, funcLabel, funcDescription, productSansFont, funcLabel);
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
      ImGui::SetNextWindowSize(ImVec2(800, 420), ImGuiCond_FirstUseEver);
      ImGui::Begin(ENCRYPT("TruongMods"), &MenDeal, ImGuiWindowFlags_NoScrollbar | ImGuiWindowFlags_NoScrollWithMouse | ImGuiWindowFlags_NoCollapse | ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoResize);
      ImDrawList *draw = ImGui::GetWindowDrawList();
      ImVec2 windowPos = ImGui::GetWindowPos();
      ImVec2 windowSize = ImGui::GetWindowSize();

      // THÔNG BÁO CHÀO MỪNG LẦN ĐẦU (Giữ nguyên)
      if (thongbaolandau) {
        ImGui::SetNextWindowPos(ImVec2((kWidth - width) / 2, (kHeight - height) / 2), ImGuiCond_FirstUseEver);
        ImGui::SetNextWindowSize(ImVec2(width, height), ImGuiCond_FirstUseEver);
        ImGui::SetNextWindowBgAlpha(0.0f); 

        ImGui::Begin("##block_input", nullptr, ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoMove);
        ImGui::End();
        ImDrawList *fg = ImGui::GetForegroundDrawList();
        ImVec2 screen_min = ImGui::GetMainViewport()->Pos;
        ImVec2 screen_max = screen_min + ImGui::GetMainViewport()->Size;
        fg->AddRectFilled(screen_min, screen_max, IM_COL32(0, 0, 5, 210));
        
        ImVec2 rect_size = ImVec2(500, 240);
        ImVec2 center = ImGui::GetMainViewport()->GetCenter();
        ImVec2 rect_min = center - rect_size * 0.5f;
        ImVec2 rect_max = rect_min + rect_size;

        fg->AddRectFilled(rect_min, rect_max, IM_COL32(20, 20, 25, 240), 20.0f);
        fg->AddRect(rect_min, rect_max, IM_COL32(255, 70, 85, 100), 20.0f, 0, 2.0f);
        
        ImGui::SetWindowFontScale(3.5f);
        ImVec2 text1_pos = rect_min + ImVec2(30, 20);
        fg->AddText(text1_pos, IM_COL32(255, 70, 85, 255), "WELCOME");
        
        ImGui::SetWindowFontScale(1.3f);
        ImVec2 text2_pos = rect_min + ImVec2(30, 70);
        fg->AddText(text2_pos, IM_COL32(220, 220, 220, 255),
                    "Chào Mừng Bạn Đến Với TRUONGMODS (Bản Valo 2026)\n"
                    "Cấu hình giao diện đã được tự động lưu lại.\n"
                    "Hãy trải nghiệm không gian Mod hiện đại, mượt mà.\n\n"
                    "Chúc Bạn Chơi Game Vui Vẻ");
        
        ImVec2 btn1_pos = rect_min + ImVec2(30, 180);
        ImVec2 btn_size = ImVec2(130, 40);
        ImVec2 btn2_pos = btn1_pos + ImVec2(130 + 15, 0);
        
        ImU32 btn_color = IM_COL32(255, 70, 85, 255);
        fg->AddRectFilled(btn1_pos, btn1_pos + btn_size, btn_color, 12.0f);
        ImVec2 text1_size = ImGui::CalcTextSize("Đóng");
        fg->AddText(btn1_pos + (btn_size - text1_size) * 0.5f, IM_COL32_WHITE, "Đóng");
        
        fg->AddRectFilled(btn2_pos, btn2_pos + btn_size, btn_color, 12.0f);
        ImVec2 text2_size = ImGui::CalcTextSize("Đóng Vĩnh Viễn");
        fg->AddText(btn2_pos + (btn_size - text2_size) * 0.5f, IM_COL32_WHITE, "Đóng Vĩnh Viễn");
        
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

      // THÔNG BÁO MOD SKIN (Giữ nguyên)
      if (thongbaomodskin) {
        ImGui::SetNextWindowPos(ImVec2((kWidth - width) / 2, (kHeight - height) / 2), ImGuiCond_FirstUseEver);
        ImGui::SetNextWindowSize(ImVec2(width, height), ImGuiCond_FirstUseEver);
        ImGui::SetNextWindowBgAlpha(0.0f); 

        ImGui::Begin("##block_input2", nullptr, ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoMove);
        ImGui::End();
        ImDrawList *fg = ImGui::GetForegroundDrawList();
        ImVec2 screen_min = ImGui::GetMainViewport()->Pos;
        ImVec2 screen_max = screen_min + ImGui::GetMainViewport()->Size;
        fg->AddRectFilled(screen_min, screen_max, IM_COL32(0, 0, 5, 210));
        
        ImVec2 rect_size = ImVec2(400, 200);
        ImVec2 center = ImGui::GetMainViewport()->GetCenter();
        ImVec2 rect_min = center - rect_size * 0.5f;
        ImVec2 rect_max = rect_min + rect_size;

        fg->AddRectFilled(rect_min, rect_max, IM_COL32(20, 20, 25, 240), 20.0f);
        fg->AddRect(rect_min, rect_max, IM_COL32(255, 70, 85, 100), 20.0f, 0, 2.0f);

        ImGui::SetWindowFontScale(3.5f);
        ImVec2 text1_pos = rect_min + ImVec2(25, 20);
        fg->AddText(text1_pos, IM_COL32(255, 70, 85, 255), "THÔNG BÁO");
        
        ImGui::SetWindowFontScale(1.3f);
        ImVec2 text2_pos = rect_min + ImVec2(25, 70);
        fg->AddText(text2_pos, IM_COL32(220, 220, 220, 255),
                    "TRƯỚC KHI BẮT ĐẦU MOD:\n"
                    "Vui lòng thoát game và vào lại để làm mới dữ liệu.\n"
                    "Sau đó nhấn vào [MOD NGAY] ở bên dưới.\n");
        
        ImVec2 btn1_pos = rect_min + ImVec2(25, 145);
        ImVec2 btn_size = ImVec2(120, 35);
        ImVec2 btn2_pos = btn1_pos + ImVec2(120 + 15, 0);
        
        ImU32 btn_color = IM_COL32(255, 70, 85, 255);
        fg->AddRectFilled(btn1_pos, btn1_pos + btn_size, btn_color, 10.0f);
        ImVec2 text1_size = ImGui::CalcTextSize("ĐÓNG");
        fg->AddText(btn1_pos + (btn_size - text1_size) * 0.5f, IM_COL32_WHITE, "ĐÓNG");
        
        fg->AddRectFilled(btn2_pos, btn2_pos + btn_size, btn_color, 10.0f);
        ImVec2 text2_size = ImGui::CalcTextSize("MOD NGAY");
        fg->AddText(btn2_pos + (btn_size - text2_size) * 0.5f, IM_COL32_WHITE, "MOD NGAY");
        
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

      // ══════════════════════════════════════════════════════════════════
      // NEW iOS GLASSMORPHISM LAYOUT
      // ══════════════════════════════════════════════════════════════════

      const float DOCK_H   = 58.0f;
      const float HEADER_H = 48.0f;

      // ─── Glass Background ────────────────────────────────────────────
      // Outer frosted glass panel
      draw->AddRectFilled(windowPos,
                          ImVec2(windowPos.x + windowSize.x, windowPos.y + windowSize.y),
                          IM_COL32(12, 12, 16, 230), 20.0f);
      // Subtle inner highlight on top edge (glass shine)
      draw->AddRectFilled(windowPos,
                          ImVec2(windowPos.x + windowSize.x, windowPos.y + 1.5f),
                          IM_COL32(255, 255, 255, 35), 20.0f);
      // Outer border
      draw->AddRect(windowPos,
                    ImVec2(windowPos.x + windowSize.x, windowPos.y + windowSize.y),
                    IM_COL32(255, 255, 255, 30), 20.0f, 0, 1.2f);

      // ─── Header Bar ──────────────────────────────────────────────────
      {
        ImVec2 hdrPos = windowPos;
        ImVec2 hdrEnd = ImVec2(windowPos.x + windowSize.x, windowPos.y + HEADER_H);
        draw->AddRectFilled(hdrPos, hdrEnd, IM_COL32(255, 255, 255, 8), 0.0f);
        draw->AddLine(ImVec2(hdrPos.x + 16, hdrEnd.y),
                      ImVec2(hdrEnd.x - 16, hdrEnd.y),
                      IM_COL32(255, 255, 255, 20));

        // Title text
        ImGui::SetCursorScreenPos(ImVec2(hdrPos.x + 20, hdrPos.y + 12));
        ImGui::SetWindowFontScale(1.9f);
        ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(255, 255, 255, 230));
        ImGui::TextUnformatted("TRUONGMODS");
        ImGui::PopStyleColor();

        // Cyan accent dot
        draw->AddCircleFilled(ImVec2(hdrPos.x + 155, hdrPos.y + HEADER_H * 0.5f),
                              4.5f, IM_COL32(10, 200, 255, 220), 16);

        // SAFE badge
        ImVec2 badgePos  = ImVec2(hdrPos.x + 168, hdrPos.y + 13);
        ImVec2 badgeEnd2 = ImVec2(badgePos.x + 58, badgePos.y + 20);
        draw->AddRectFilled(badgePos, badgeEnd2, IM_COL32(10, 200, 255, 40), 10.0f);
        draw->AddRect(badgePos, badgeEnd2, IM_COL32(10, 200, 255, 100), 10.0f, 0, 1.0f);
        ImGui::SetCursorScreenPos(ImVec2(badgePos.x + 8, badgePos.y + 2));
        ImGui::SetWindowFontScale(1.0f);
        ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(10, 200, 255, 220));
        ImGui::TextUnformatted("SAFE");
        ImGui::PopStyleColor();

        // Close button (X)
        ImVec2 closePos = ImVec2(hdrEnd.x - 40, hdrPos.y + (HEADER_H - 28) * 0.5f);
        ImGui::SetCursorScreenPos(closePos);
        if (ImGui::InvisibleButton("iosClose", ImVec2(28, 28))) {
          MenDeal = false;
        }
        bool closehov = ImGui::IsItemHovered();
        draw->AddCircleFilled(ImVec2(closePos.x + 14, closePos.y + 14), 14.0f,
                              closehov ? IM_COL32(255,80,80,200) : IM_COL32(255,255,255,18), 20);
        ImGui::SetCursorScreenPos(ImVec2(closePos.x + 8, closePos.y + 5));
        ImGui::SetWindowFontScale(1.4f);
        ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(255, 255, 255, 200));
        ImGui::TextUnformatted("x");
        ImGui::PopStyleColor();
      }

      // ─── Scrollable Content Area ──────────────────────────────────────
      float contentH = windowSize.y - HEADER_H - DOCK_H - 8;
      ImGui::SetCursorPos(ImVec2(0, HEADER_H + 4));
      ImGui::BeginChild("##iosContent", ImVec2(windowSize.x, contentH), false,
                        ImGuiWindowFlags_NoScrollbar);
      ImGui::SetWindowFontScale(1.45f);
      ImGui::Indent(14.0f);

      // ── TAB CONTENT ──────────────────────────────────────────────────
      if (Settings::Tab == 1) {
        // HOME — 2-column quick toggle grid
        ImGui::Spacing();
        iOSToggle(MapHack,    "Map Hack",    "Hiện toàn bộ tầm nhìn bản đồ",  self.italic, "t_maphack");
        iOSToggle(CamSieuXa,  "Cam Siêu Xa","Tăng tầm nhìn camera xa hơn",   self.italic, "t_camxa");
        iOSToggle(Avan,       "Hiện Ulti",  "Hiển thị hồi chiêu ult địch",    self.italic, "t_avan");
        iOSToggle(hiensp,     "Hiện SP",    "Hiển thị phép bổ trợ địch",      self.italic, "t_hiensp");
        iOSToggle(hiendanh,   "Hiện Tên",   "Hiển thị tên tướng địch",        self.italic, "t_hiendanh");
        iOSToggle(SieuFPS,    "Mượt Game",  "Tăng tốc lên 120 FPS",           self.italic, "t_sieufps");
        ImGui::Spacing();
        // Quick-nav cards
        if (iOSCard("Aimbot",    "Ghim chiêu định hướng tướng",   self.italic, "nav_aim"))    { Settings::Tab = 2; }
        if (iOSCard("Autoplay",  "Macro tự động kỹ năng",          self.italic, "nav_auto"))   { Settings::Tab = 3; }
        if (iOSCard("Mod Skin",  "Mod ngoại hình & rank",          self.italic, "nav_mod"))    { Settings::Tab = 5; }
        if (iOSCard("Extra",     "Chức năng giải trí",             self.italic, "nav_extra"))  { Settings::Tab = 7; }

      } else if (Settings::Tab == 2) {
        // AIMBOT
        ImGui::Spacing();
        iOSToggle(Aimbot,      "Aimbot",        "Bật tắt toàn bộ hệ thống aimbot",  self.italic, "t_aimbot");
        if (Aimbot) {
          iOSToggle(AimbotElsu,  "Aimbot Elsu",  "Ghim chiêu 2 Elsu",    self.italic, "t_aelsu");
          iOSToggle(AimbotYorn,  "Aimbot Yorn",  "Ghim chiêu Yorn",       self.italic, "t_ayorn");
          iOSToggle(AimbotJoker, "Aimbot Joker", "Ghim chiêu Joker",      self.italic, "t_ajoker");
          iOSToggle(AimbotGrakk, "Aimbot Grakk", "Ghim chiêu Grakk",      self.italic, "t_agrakk");
          iOSToggle(AimbotIggy,  "Aimbot Iggy",  "Ghim chiêu Iggy",       self.italic, "t_aiggy");
          iOSToggle(AimbotRyoma, "Aimbot Ryoma", "Ghim chiêu Ryoma",      self.italic, "t_aryoma");
          iOSToggle(AimbotGildur,"Aimbot Gildur","Ghim chiêu Gildur",     self.italic, "t_agildur");
          iOSToggle(AimbotRaz,   "Aimbot Raz",   "Ghim chiêu Raz",        self.italic, "t_araz");
          iOSToggle(AimbotIllu,  "Aimbot Illumia","Ghim chiêu Illumia",   self.italic, "t_aillu");
          iOSToggle(AimbotDirak, "Aimbot Dirak", "Ghim chiêu Dirak",      self.italic, "t_adirak");
        }

      } else if (Settings::Tab == 3) {
        // AUTOPLAY
        ImGui::Spacing();
        iOSToggle(macrotudong,   "Macro Tự Động", "Đánh liên hoàn tự động",              self.italic, "t_macro");
        iOSToggle(AutoBocPha,    "Auto Bộc Phá",  "Tự động dùng bộc phá",                self.italic, "t_bocpha");
        iOSToggle(AutoTrungTri,  "Auto Trừng Trị","Tự động trừng trị quái",              self.italic, "t_trungtri");
        iOSToggle(RongTaThan,    "Rồng / Tà Thần","Ưu tiên giật rồng & tà thần",         self.italic, "t_rongtathan");
        iOSToggle(AutoChoang,    "Auto Choáng",   "Tự động dùng kỹ năng choáng",         self.italic, "t_choang");
        iOSToggle(AutoQuacam,    "Auto Quả Cầu",  "Tự kích hoạt quả cầu phép",           self.italic, "t_quacau");
        iOSToggle(AutoNhamThach, "Auto Nham Thạch","Tự kích hoạt nham thạch",            self.italic, "t_nhamthach");
        iOSToggle(TuMuaBan,      "Tự Động Mua Bán","Tự đổi trang bị & bán đồ thừa",     self.italic, "t_muaban");

      } else if (Settings::Tab == 5) {
        // MOD SKIN
        ImGui::Spacing();
        if (iOSCard("Mod Skin File", "Mod ngoại hình qua file/link", self.italic, "btnModSkin")) {
          thongbaomodskin = true;
        }
        if (iOSCard("Xóa Mod", "Xóa mod skin / cập nhật lại", self.italic, "btnXoaMod")) {
          MenDeal = false;
          UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"XOÁ MOD SKIN ?" message:nil preferredStyle:UIAlertControllerStyleAlert];
          UIAlertAction *clear = [UIAlertAction actionWithTitle:@"XOÁ MOD SKIN" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) { [ModSkinDSGM RemoveModDSGM]; }];
          UIAlertAction *force = [UIAlertAction actionWithTitle:@"FORCE UPDATE" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) { [[maintool sharemain] xoamod]; }];
          UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
          [alert addAction:clear]; [alert addAction:force]; [alert addAction:okAction];
          UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
          [viewController presentViewController:alert animated:YES completion:nil];
          TriggerHapticFeedback();
        }
        if (iOSCard("Save Account", "Đổi tài khoản nhanh", self.italic, "btnSaveAcc")) {
          MenDeal = false;
          [[maintool sharemain] LoadAcc];
          [[maintool sharemain] ChangeAccount];
          TriggerHapticFeedback();
        }
        // Đổi tên card
        {
          ImVec2 cardPos = ImGui::GetCursorScreenPos();
          float cw = ImGui::GetContentRegionAvail().x;
          ImGui::SetCursorScreenPos(cardPos);
          if (ImGui::InvisibleButton("doiten", ImVec2(cw, 56.0f))) {
            doiten = !doiten;
            MenDeal = false;
            if (doiten) {
              UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"LƯU Ý" message:@"Sau khi nhập tên thì hãy nhấn lại chức năng để đổi lại sang màu đỏ rồi nhấn đổi để đổi tên thành công" preferredStyle:UIAlertControllerStyleAlert];
              UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
              UIViewController *rootVC = keyWindow.rootViewController;
              [rootVC presentViewController:alert animated:YES completion:nil];
              UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
              [alert addAction:okAction];
            }
          }
          ImDrawList *cdl = ImGui::GetWindowDrawList();
          ImU32 cbg = doiten ? IM_COL32(10, 200, 255, 60) : IM_COL32(255, 255, 255, 11);
          ImU32 cbrd = doiten ? IM_COL32(10, 200, 255, 180) : IM_COL32(255, 255, 255, 28);
          cdl->AddRectFilled(cardPos, ImVec2(cardPos.x + cw, cardPos.y + 56), cbg, 14.0f);
          cdl->AddRect(cardPos, ImVec2(cardPos.x + cw, cardPos.y + 56), cbrd, 14.0f, 0, 1.2f);
          ImGui::SetCursorScreenPos(ImVec2(cardPos.x + 14, cardPos.y + 10));
          ImGui::SetWindowFontScale(1.55f);
          ImGui::PushStyleColor(ImGuiCol_Text, IM_COL32(240, 240, 245, 255));
          ImGui::TextUnformatted("Doi Ten Dai (Ten Account)");
          ImGui::PopStyleColor();
          ImGui::SetCursorScreenPos(ImVec2(cardPos.x + 14, cardPos.y + 31));
          ImGui::SetWindowFontScale(1.0f);
          ImGui::PushFont(self.italic);
          ImGui::PushStyleColor(ImGuiCol_Text, doiten ? IM_COL32(10,200,255,200) : IM_COL32(130,130,145,255));
          ImGui::TextUnformatted(doiten ? "Dang bat - nhan de tat" : "Nhan de doi ten account");
          ImGui::PopStyleColor();
          ImGui::PopFont();
          ImGui::SetCursorScreenPos(ImVec2(cardPos.x, cardPos.y + 56 + 8));
        }

      } else if (Settings::Tab == 6) {
        // INFORMATION
        ImGui::Spacing();
        if (iOSCard("Mo Thu Muc App", "Xem file & thu muc cai dat", self.italic, "btn_close_dir")) {
          MenDeal = false;
          [[maintool sharemain] openAppDirectory];
        }
        ImGui::Spacing();
        iOSToggle(ANICON, "An Icon Menu", "Cham 3 ngon 3 lan de mo lai", self.italic, "t_anicon");
        // Save ANICON state when changed
        {
          static bool prevANICON = ANICON;
          if (prevANICON != ANICON) {
            prevANICON = ANICON;
            saveStateBool(kANICONStateKey, ANICON);
            MenuLoad *menuLoadInstance = [MenuLoad createInstance];
            [menuLoadInstance hidemenuBtn];
          }
        }

      } else if (Settings::Tab == 7) {
        // EXTRA
        ImGui::Spacing();
        iOSToggle(spamchat, "Spam Chat x10",   "Chat lien tuc 10 lan",           self.italic, "t_spam");
        iOSToggle(balo,     "Ban Do Balo",      "Moi mon gia 1 vang",             self.italic, "t_balo");
        iOSToggle(tkms,     "Buff No",          "Khong duoc lam dung!",           self.italic, "t_tkms");
        iOSToggle(autowin,  "Auto Win",         "Vao game tu win",                self.italic, "t_autowin");
        iOSToggle(nocd,     "No Cooldown",      "Xa chieu thoai mai",             self.italic, "t_nocd");
        iOSToggle(onehit,   "One Hit",          "Damage 99999999",                self.italic, "t_onehit");
      }

      ImGui::Unindent(14.0f);
      ImGui::EndChild(); // ##iosContent

      // ─── Bottom Dock Navigation ───────────────────────────────────────
      {
        float dockY = windowPos.y + windowSize.y - DOCK_H;
        ImVec2 dockMin = ImVec2(windowPos.x, dockY);
        ImVec2 dockMax = ImVec2(windowPos.x + windowSize.x, dockY + DOCK_H);

        // Dock glass background
        draw->AddRectFilled(dockMin, dockMax, IM_COL32(18, 18, 24, 220), 0.0f);
        draw->AddLine(ImVec2(dockMin.x + 16, dockMin.y),
                      ImVec2(dockMax.x - 16, dockMin.y),
                      IM_COL32(255, 255, 255, 22));

        // Tab definitions: {tabId, label}
        struct DockTab { int id; const char *label; };
        DockTab tabs[] = { {1,"Home"}, {2,"Aim"}, {3,"Auto"}, {5,"Mod"}, {6,"Info"}, {7,"Extra"} };
        int numTabs = 6;
        float btnW = windowSize.x / numTabs;

        for (int i = 0; i < numTabs; i++) {
          bool isActive = (Settings::Tab == tabs[i].id);
          ImVec2 btnMin = ImVec2(dockMin.x + i * btnW, dockMin.y);
          ImVec2 btnMax = ImVec2(btnMin.x + btnW, dockMax.y);
          ImVec2 center = ImVec2((btnMin.x + btnMax.x) * 0.5f, (btnMin.y + btnMax.y) * 0.5f);

          // Hit area
          ImGui::SetCursorScreenPos(btnMin);
          char dockId[16]; sprintf(dockId, "dock%d", tabs[i].id);
          if (ImGui::InvisibleButton(dockId, ImVec2(btnW, DOCK_H))) {
            Settings::Tab = tabs[i].id;
            TriggerHapticFeedback();
          }
          bool hovDock = ImGui::IsItemHovered();

          // Active indicator pill at top
          if (isActive) {
            float pillW = 28.0f, pillH = 3.0f;
            draw->AddRectFilled(ImVec2(center.x - pillW * 0.5f, btnMin.y + 4),
                                ImVec2(center.x + pillW * 0.5f, btnMin.y + 4 + pillH),
                                IM_COL32(10, 200, 255, 230), pillH * 0.5f);
          }

          // Label
          ImGui::SetCursorScreenPos(ImVec2(btnMin.x, center.y - 8));
          ImGui::SetWindowFontScale(1.15f);
          ImU32 txtCol = isActive ? IM_COL32(10, 200, 255, 255) :
                         (hovDock ? IM_COL32(200, 200, 210, 255) : IM_COL32(110, 110, 125, 255));
          ImVec2 tsize = ImGui::CalcTextSize(tabs[i].label);
          draw->AddText(ImVec2(center.x - tsize.x * 0.5f, center.y - tsize.y * 0.5f),
                        txtCol, tabs[i].label);
        }
      }

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
    // iOS Glassmorphism palette — translucent dark, cyan accent
    colors[ImGuiCol_WindowBg]        = ImVec4(0.05f, 0.05f, 0.07f, 0.00f); // fully transparent (we draw our own bg)
    colors[ImGuiCol_ChildBg]         = ImVec4(0.00f, 0.00f, 0.00f, 0.00f);
    colors[ImGuiCol_Border]          = ImVec4(1.00f, 1.00f, 1.00f, 0.08f);
    colors[ImGuiCol_FrameBg]         = ImVec4(0.12f, 0.12f, 0.15f, 1.00f);
    colors[ImGuiCol_FrameBgHovered]  = ImVec4(0.18f, 0.18f, 0.22f, 1.00f);
    colors[ImGuiCol_FrameBgActive]   = ImVec4(0.04f, 0.78f, 1.00f, 0.40f);
    colors[ImGuiCol_CheckMark]       = ImVec4(0.04f, 0.78f, 1.00f, 1.00f);
    colors[ImGuiCol_SliderGrab]      = ImVec4(0.04f, 0.78f, 1.00f, 1.00f);
    colors[ImGuiCol_SliderGrabActive]= ImVec4(0.10f, 0.90f, 1.00f, 1.00f);
    colors[ImGuiCol_Button]          = ImVec4(1.00f, 1.00f, 1.00f, 0.06f);
    colors[ImGuiCol_ButtonHovered]   = ImVec4(1.00f, 1.00f, 1.00f, 0.12f);
    colors[ImGuiCol_ButtonActive]    = ImVec4(0.04f, 0.78f, 1.00f, 0.50f);
    colors[ImGuiCol_Header]          = ImVec4(0.00f, 0.00f, 0.00f, 0.00f);
    colors[ImGuiCol_HeaderHovered]   = ImVec4(1.00f, 1.00f, 1.00f, 0.06f);
    colors[ImGuiCol_Text]            = ImVec4(0.94f, 0.94f, 0.96f, 1.00f);
    colors[ImGuiCol_TextDisabled]    = ImVec4(0.50f, 0.50f, 0.55f, 1.00f);
    colors[ImGuiCol_ScrollbarBg]     = ImVec4(0.00f, 0.00f, 0.00f, 0.00f);
    colors[ImGuiCol_ScrollbarGrab]   = ImVec4(1.00f, 1.00f, 1.00f, 0.15f);

    style.WindowPadding   = ImVec2(0, 0);
    style.WindowRounding  = 20.0f;
    style.ChildRounding   = 14.0f;
    style.FrameRounding   = 10.0f;
    style.GrabRounding    = 10.0f;
    style.PopupRounding   = 14.0f;
    style.ScrollbarRounding = 10.0f;
    style.FramePadding    = ImVec2(10, 6);
    style.ItemSpacing     = ImVec2(8, 6);
    style.ScrollbarSize   = 6.0f;
    style.GrabMinSize     = 20.0f;
    style.Alpha           = 1.0f;

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