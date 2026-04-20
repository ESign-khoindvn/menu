#import "iconlq.h"

// ▗▖ ▗▖▗▖ ▗▖ ▗▄▖ ▗▄▄▄▖     ▗▄▄▖  ▗▄▖  ▗▄▖
// ▐▌▗▞▘▐▌ ▐▌▐▌ ▐▌  █       ▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌
// ▐▛▚▖ ▐▛▀▜▌▐▛▀▜▌  █       ▐▛▀▚▖▐▛▀▜▌▐▌ ▐▌
// ▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌▗▄█▄▖     ▐▙▄▞▘▐▌ ▐▌▝▚▄▞▘
// KHAI BAO

int (*ValueLinkerComponent_get_actorHp)(void *instance);
int (*ValueLinkerComponent_get_actorHpTotal)(void *instance);
int (*ValueLinkerComponent_get_actorSoulLevel)(void *instance);
int (*ValueLinkerComponent_get_actorMgcAtkPTTotal)(void *instance);
int (*ValueLinkerComponent_get_actorPhyAtkPTTotal)(void *instance);

bool (*ActorLinker_IsHostPlayer)(void *instance);
bool (*ActorLinker_IsHostCamp)(void *instance);
int (*ActorLinker_ActorTypeDef)(void *instance);
int (*ActorLinker_COM_PLAYERCAMP)(void *instance);
Vector3 (*ActorLinker_getPosition)(void *instance);
bool (*ActorLinker_get_bVisible)(void *instance);
uintptr_t (*LActorRoot_LHeroWrapper)(void *instance);
int (*LActorRoot_COM_PLAYERCAMP)(void *instance);
bool (*LObjWrapper_get_IsDeadState)(void *instance);
bool (*LObjWrapper_IsAutoAI)(void *instance);
int (*ValuePropertyComponent_get_actorHp)(void *instance);
int (*ValuePropertyComponent_get_actorHpTotal)(void *instance);
void *(*get_actorManager)();

uintptr_t (*AsHero)(void *);
void (*SetPlayerName)(void* instance, MonoString* playerName, MonoString* prefixName, bool isGuideLevel,MonoString* Customname);


// ▗▄▖ ▗▖ ▗▖▗▄▄▄▖ ▗▄▖       ▗▄▄▖▗▖ ▗▖▗▄▄▄▖▗▖   ▗▖
// ▐▌ ▐▌▐▌ ▐▌  █  ▐▌ ▐▌     ▐▌   ▐▌▗▞▘  █  ▐▌   ▐▌
// ▐▛▀▜▌▐▌ ▐▌  █  ▐▌ ▐▌      ▝▀▚▖▐▛▚▖   █  ▐▌   ▐▌
// ▐▌ ▐▌▝▚▄▞▘  █  ▝▚▄▞▘     ▗▄▄▞▘▐▌ ▐▌▗▄█▄▖▐▙▄▄▖▐▙▄▄▖
// AUTO SKILL
Vector3 CurrentPosition;
void *Req0 = NULL, *Req1 = NULL, *Req2 = NULL, *Req3 = NULL, *Req4 = NULL,
     *Req5 = NULL, *Req6 = NULL, *Req9 = NULL, *Req13 = NULL;
float MyHP = 0.0f, EnemyHP = 0.0f, MonsterHP = 0.0f;
extern float maubotro;

// Moved definitions from below
std::unordered_map<uintptr_t, Vector3> previousEnemyPositions;

// Assuming EntityManager class is visible or we need to use void* if incomplete
// type But since it was 'new EntityManager()', it must be visible. If it fails,
// we know EntityManager is not defined here. For now, moving it up.
EntityManager *espManager = new EntityManager();
EntityManager *ActorLinker_enemy = new EntityManager();

bool AimSkill, AimSkill1, AimSkill2, AimSkill3, DrawAimLine;
struct EntityInfo {
  Vector3 myPos;
  Vector3 enemyPos;
  Vector3 moveForward;
  int currentSpeed;
  float DoLech;
  float Ranger;
};
float Rangeskill0;
float Rangeskill1;
float Rangeskill2;
float Rangeskill3;
float Rangeskill4;
float Rangeskill5;
float Rangeskill6;
float Rangeskill9;
float Rangeskill13;
EntityInfo EnemyTarget;
void *(*LActorRoot_AsHero)(void *instance);
int SkillSlot, aimType, drawType;
float KhoangCach = 0.0f, DoLechAim = 0.0f, GetDistanceEnemy = 0.0f;

int Radius = 25;
int skill1 = 0;
int skill2 = 0;
int skill3 = 0;
bool AutoTrung;
bool aimSkill1 = false;
bool aimSkill2 = false;
bool aimSkill3 = false;
bool aimskillv1 = true;
bool startaim = true;
bool aimcoban = false;

Vector3 RotateVectorByQuaternion(Quaternion q) {
  Vector3 v(0.0f, 0.0f, 1.0f);
  float w = q.w, x = q.x, y = q.y, z = q.z;

  Vector3 u(x, y, z);
  Vector3 cross1 = Vector3::Cross(u, v);
  Vector3 cross2 = Vector3::Cross(u, cross1);
  Vector3 result = v + 2.0f * cross1 * w + 2.0f * cross2;

  return result;
}

float SquaredDistance(Vector3 v, Vector3 o) {
  return (v.x - o.x) * (v.x - o.x) + (v.y - o.y) * (v.y - o.y) +
         (v.z - o.z) * (v.z - o.z);
}
// Forward declarations for functions used in Skslot
int dem(int num);
Vector3 VInt2Vector(VInt3 location, VInt3 forward);

void Skslot(void *ins, int del) {
  if (ins != NULL) {
    int slot = *(int *)((uintptr_t)ins + Sk_SlotType);
    void *skillControl = *(void **)((uintptr_t)ins + Sk_skillIndicator);

    if (skillControl == NULL)
      return;

    int range = *(int *)((uintptr_t)skillControl + Sk_curindicatorDistance);
    Vector3 currentPosition =
        *(Vector3 *)((uintptr_t)skillControl + Sk_useSkillDirection);

    switch (slot) {
    case 0:
      Req0 = ins;
      Rangeskill0 = (float)range / 1000.0f;
      break;
    case 1:
      Req1 = ins;
      Rangeskill1 = (float)range / 1000.0f;
      break;
    case 2:
      Req2 = ins;
      Rangeskill2 = (float)range / 1000.0f;
      break;
    case 3:
      Req3 = ins;
      Rangeskill3 = (float)range / 1000.0f;
      break;
    case 4:
      Req4 = ins;
      break;
    case 5:
      Req5 = ins;
      break;
    case 6:
      Req6 = ins;
      break;
    case 9:
      Req9 = ins;
      break;
    case 13:
      Req13 = ins;
      Rangeskill13 = (float)range / 1000.0f;
      break;
    default:
      break;
    }
    if (slot == SkillSlot)
      CurrentPosition = currentPosition;

    void *MySkill = Lmyactor;
    if (!MySkill)
      return;
    void *SKControl = LActorRoot_AsHero(MySkill);
    bool AutoPTLogID = false, AutoBPLogID = false, AutoTTLogID = false,
         CastSkill5 = false;
    if (SKControl != NULL) {
      HeroWrapSkillData SkillData5 =
          LHeroWrapper_GetHeroWrapSkillData(SKControl, 5);
      HeroWrapSkillData SkillData9 =
          LHeroWrapper_GetHeroWrapSkillData(SKControl, 9);
      AutoPTLogID =
          (SkillData9.SkillId == 80112 || SkillData9.SkillId == 8810101 ||
           SkillData9.SkillId == 91145 || SkillData9.SkillId == 91149 ||
           SkillData9.SkillId == 91020 || SkillData9.SkillId == 916211 ||
           SkillData9.SkillId == 916231)
              ? true
              : false;
      AutoBPLogID = (SkillData5.SkillId == 80108) ? true : false;
      AutoTTLogID = (SkillData5.SkillId == 80104 || SkillData5.SkillId == 80116)
                        ? true
                        : false;

      if (slot == 5) {
        if (autobocpha && AutoBPLogID) {
          if (espManager != NULL && espManager->enemies != NULL) {
            for (int i = 0; i < espManager->enemies->size(); i++) {
              if (i >= espManager->enemies->size())
                break;
              void *MyActor = espManager->MyPlayer;
              void *Enemy = (*espManager->enemies)[i]->object;
              Vector3 MyPos = Vector3::zero();
              Vector3 EnemyPos = Vector3::zero();
              if (!MyActor || !Enemy)
                continue;
              myActorLinker = MyActor;

              MyPos = ActorLinker_getPosition(MyActor);
              VInt3 *locationPtr =
                  (VInt3 *)((uint64_t)Enemy + LActorRoot_location);
              VInt3 *forwardPtr =
                  (VInt3 *)((uint64_t)Enemy + LActorRoot_forward);
              EnemyPos = VInt2Vector(*locationPtr, *forwardPtr);
              float Distance = Vector3::Distance(MyPos, EnemyPos);

              void *LObjWrapper =
                  *(void **)((uint64_t)Enemy + LActorRoot_ActorControl);
              void *ValuePropertyComponent =
                  *(void **)((uint64_t)Enemy + LActorRoot_ValueComponent);

              if (!LObjWrapper || !ValuePropertyComponent)
                continue;
              if (LObjWrapper_get_IsDeadState(LObjWrapper))
                continue;
              int Health =
                  ValuePropertyComponent_get_actorHp(ValuePropertyComponent);
              int MaxHealth = ValuePropertyComponent_get_actorHpTotal(
                  ValuePropertyComponent);
              if (Health < 0 || MaxHealth < 0)
                continue;
              float HpEnemy = ((float)Health / (float)MaxHealth) * 100.0f;
              if (Distance < 5.0f && HpEnemy > 0.1f && HpEnemy <= maubotro) {
                CastSkill5 = true;
                break;
              }
            }
          }
          if (CastSkill5) {
            Reqskill2(Req5, false);
            Reqskill(Req5);
          }
        }
      }
    }
    return _Skslot(ins, del);
  }
}

float defFov = 30;
void (*set_fieldOfView)(void *camera, float value);
void *(*get_mainfov)(void *null);
void (*old_LateUpdate)(void *instance);

void LateUpdatee(void *instance) {
  if (instance != NULL) {
    void *cam = get_mainfov(NULL);
    if (cam != NULL && drone != 0) {
      set_fieldOfView(cam, (drone * 2) + defFov);
    } else {
      set_fieldOfView(cam, defFov);
    }
    old_LateUpdate(instance); // Call the original LateUpdate
  }
}

// ▗▄▖ ▗▄▄▄▖▗▖  ▗▖▗▄▄▖  ▗▄▖ ▗▄▄▄▖
// ▐▌ ▐▌  █  ▐▛▚▞▜▌▐▌ ▐▌▐▌ ▐▌  █
// ▐▛▀▜▌  █  ▐▌  ▐▌▐▛▀▚▖▐▌ ▐▌  █
// ▐▌ ▐▌▗▄█▄▖▐▌  ▐▌▐▙▄▞▘▝▚▄▞▘  █
// AIMBOT
// Moved definitions to top
// Definitions moved to top

int dem(int num) {
  int div = 1, num1 = num;
  while (num1 != 0) {
    num1 = num1 / 10;
    div = div * 10;
  }
  return div;
}

Vector3 VInt2Vector(VInt3 location, VInt3 forward) {
  return Vector3((float)(location.X * dem(forward.X) + forward.X) /
                     (1000 * dem(forward.X)),
                 (float)(location.Y * dem(forward.Y) + forward.Y) /
                     (1000 * dem(forward.Y)),
                 (float)(location.Z * dem(forward.Z) + forward.Z) /
                     (1000 * dem(forward.Z)));
}

Vector3 Lerp(Vector3 &a, const Vector3 &b, float t) {
  if (Vector3::Distance(a, b) > 1)
    a = b;
  return Vector3{a.x + (b.x - a.x) * t, a.y + (b.y - a.y) * t,
                 a.z + (b.z - a.z) * t};
}

Vector3 VIntVector(VInt3 location) {
  return Vector3((float)(location.X) / (1000), (float)(location.Y) / (1000),
                 (float)(location.Z) / (1000));
}

float ClosestDistanceEnemy(Vector3 myPos, Vector3 enemyPos, Vector3 direction) {
  Vector3 AC = enemyPos - myPos;
  Vector3 AB = direction;
  float t = Vector3::Dot(AC, AB);
  Vector3 projectionPoint = myPos + AB * t;
  return Vector3::Distance(projectionPoint, enemyPos);
}

Vector3 calculateSkillDirection(Vector3 myPosi, Vector3 enemyPosi,
                                Vector3 moveForward, int currentSpeed,
                                float DoLech) {
  Vector3 futureEnemyPos = Vector3::zero();
  Vector3 toEnemy = enemyPosi - myPosi;
  float distanceToEnemy = Vector3::Magnitude(toEnemy);
  float defaultBulletSpeed = KhoangCach / DoLechAim;
  if (DoLechAim == 0) {
    return Vector3::Normalized(enemyPosi - myPosi); // Fallback
  }
  float timeToHit = distanceToEnemy / defaultBulletSpeed;
  futureEnemyPos = enemyPosi + moveForward * currentSpeed * timeToHit;
  Vector3 shootingDirection = futureEnemyPos - myPosi;
  return Vector3::Normalized(shootingDirection);
}

Vector3 (*_GetUseSkillDirection)(void *instance, bool isTouchUse);
Vector3 GetUseSkillDirection(void *instance, bool isTouchUse) {
  if (instance != NULL && AimSkill && Entity != NULL) {
    if (EnemyTarget.myPos != Vector3::zero() &&
        EnemyTarget.enemyPos != Vector3::zero() &&
        ((SkillSlot == 1 && AimSkill1) || (SkillSlot == 2 && AimSkill2) ||
         (SkillSlot == 3 && AimSkill3))) {
      return calculateSkillDirection(
          EnemyTarget.myPos, EnemyTarget.enemyPos, EnemyTarget.moveForward,
          EnemyTarget.currentSpeed, EnemyTarget.DoLech);
    }
  }
  return _GetUseSkillDirection(instance, isTouchUse);
}

void (*_SkillButtonManager_LateUpdate)(void *instance);
void SkillButtonManager_LateUpdate(void *instance) {
  if (instance != NULL)
    SkillSlot = GetCurSkillSlotType(instance);
  return _SkillButtonManager_LateUpdate(instance);
}

// esp
void (*old_ActorLinker_ActorDestroy)(void *instance);
void ActorLinker_ActorDestroy(void *instance) {
  if (instance != NULL) {
    old_ActorLinker_ActorDestroy(instance);
    ActorLinker_enemy->removeEnemyGivenObject(instance);
    if (espManager->MyPlayer == instance) {
      espManager->MyPlayer = NULL;
    }
  }
}

void (*old_LActorRoot_ActorDestroy)(void *instance, bool bTriggerEvent);
void LActorRoot_ActorDestroy(void *instance, bool bTriggerEvent) {
  if (instance != NULL) {
    old_LActorRoot_ActorDestroy(instance, bTriggerEvent);
    espManager->removeEnemyGivenObject(instance);
  }
}
int* SkillControlAll(void* instance)
{
    void* SkillControl = ActorLinker_AsHero(instance);
    int* cooldowns = (int*)malloc(5 * sizeof(int));
    if(SkillControl != NULL)
    {
        int skill4 = *(int*) ((uintptr_t)SkillControl + ActorLinkerOffField[15]);
        uintptr_t Skill1Cd = (int)ceil(*(int *)((uintptr_t)SkillControl + ActorLinkerOffField[12] + ActorLinkerOffField[16] + oxoranyoffset("0x8")) / 1000.0);
        uintptr_t Skill2Cd = (int)ceil(*(int *) ((uintptr_t)SkillControl + ActorLinkerOffField[13] + ActorLinkerOffField[16] + oxoranyoffset("0x8")) / 1000.0);
        uintptr_t Skill3Cd = (int)ceil(*(int *) ((uintptr_t)SkillControl + ActorLinkerOffField[14] + ActorLinkerOffField[16] + oxoranyoffset("0x8")) / 1000.0);
        uintptr_t Skill4Cd = (int)ceil(*(int *) ((uintptr_t)SkillControl + ActorLinkerOffField[15] + ActorLinkerOffField[16] + oxoranyoffset("0x8")) / 1000.0);
        cooldowns[0] = Skill1Cd;
        cooldowns[1] = Skill2Cd;
        cooldowns[2] = Skill3Cd;
        cooldowns[3] = Skill4Cd;
        cooldowns[4] = skill4 > 3100000 ? (skill4 - 3100000) : skill4;
        return cooldowns;
    }
    free(cooldowns);
    return NULL;
}
void (*old_ActorLinker_Update)(void *instance);
void ActorLinker_Update(void *instance) {
  if (instance != NULL) {
    if(showcd && SetPlayerName != nullptr) {
      void* HudControl = *(void**)((uintptr_t)instance + ActorLinkerOffField[1]);
                if(HudControl != nullptr) {
                    void* ObjLinker = *(void**)((uintptr_t)instance + ActorLinkerOffField[3]);
                    if(ObjLinker != nullptr) {
                      if(SkillControlAll != nullptr) {
                                int* sc = SkillControlAll(instance);
                                if(sc != nullptr) {
                                    string sk1 = (sc[0] == 0) ? " [S1] " : " [" + to_string(sc[0]) + "] ";
                                    string sk2 = (sc[1] == 0) ? " [S2]" : " [" + to_string(sc[1]) + "] ";
                                    string sk3 = (sc[2] == 0) ? " [S3] " : " [" + to_string(sc[2]) + "] ";
                                    string sk4 = (sc[3] == 0) ? " [P] " : " [" + to_string(sc[3]) + "] ";
                                    SetPlayerName(HudControl, (MonoString*)CreateMonoString((sk1+sk2+sk3).c_str()), (MonoString*)CreateMonoString(sk4.c_str()), false, (MonoString*)CreateMonoString(""));
                                    free(sc);
                                }
                            }
                    }
                }
        }
    old_ActorLinker_Update(instance);
    if (myActorLinker != nullptr) {
      int myTeam = ActorLinker_COM_PLAYERCAMP(myActorLinker);
      if(AutoWin){
      if(myTeam == 1){
        ForceKillCrystal(2);
      } else {
        ForceKillCrystal(1);
      }
      }
      if(AutoLose){
      if(myTeam == 1){
        ForceKillCrystal(1);
      } else {
        ForceKillCrystal(2);
      } 
      }
    }
    if (ActorLinker_ActorTypeDef(instance) == 0) {
      if (ActorLinker_IsHostPlayer(instance) == true) {
        espManager->tryAddMyPlayer(instance);
      } else {
        if (espManager->MyPlayer != NULL) {
          if (ActorLinker_COM_PLAYERCAMP(espManager->MyPlayer) !=
              ActorLinker_COM_PLAYERCAMP(instance)) {
            ActorLinker_enemy->tryAddEnemy(instance);
          }
        }
      }
    }
    if (ActorLinker_ActorTypeDef(instance) == 1) {
      void *ObjLinkerMT = *(void **)((uintptr_t)instance + Actorlk_ObjLinker);
      if (ObjLinkerMT != NULL) {
        int ConfigIDMT =
            *(int *)((uintptr_t)ObjLinkerMT + ActorConfig_ConfigID);
      }
    }
  }
}

void (*old_LActorRoot_UpdateLogic)(void *instance, int delta);
void LActorRoot_UpdateLogic(void *instance, int delta) {
  if (instance != NULL) {
    old_LActorRoot_UpdateLogic(instance, delta);
    if (espManager->MyPlayer != NULL) {
      if (LActorRoot_AsHero(instance) != NULL) {
        if (LActorRoot_COM_PLAYERCAMP(instance) ==
            ActorLinker_COM_PLAYERCAMP(espManager->MyPlayer)) {
          espManager->tryAddEnemy(instance);
        }
        Lactor = instance;
        ActorLK = espManager->MyPlayer;
        myActorLinker = ActorLK;

        if (Lactor && ActorLK && LActorRoot_get_ObjID &&
            ActorLinker_get_ObjID) {
          if (LActorRoot_get_ObjID(Lactor) == ActorLinker_get_ObjID(ActorLK))
            Lmyactor = instance;
        }
      }
    }
  }
}

static bool AutoSet = false;
static bool Reset1lan = false;
int HeroSet = 0;
static int ResetSkill = -1;
static bool ResetDraw = false;

void AutoHero() {
  const char *HeroList[] = {"Tướng Tuỳ Chỉnh", "Elsu",       "Gildur",  "Grakk",
                            "Slimz",           "Yue",        "Natalya", "Enzo",
                            "Stuart",          "Florentino", "Volkath", "Raz"};
  if (ImGui::Combo("Chọn Tướng", &HeroSet, HeroList, IM_ARRAYSIZE(HeroList))) {
    AutoSet = false;
    Reset1lan = false;
    ResetSkill = -1;
    ResetDraw = false;
  }

  if (ResetSkill != HeroSet) {
    ResetSkill = HeroSet;
    Reset1lan = false;

    AimSkill1 = false;
    AimSkill2 = false;
    AimSkill3 = false;

    switch (HeroSet) {
    case 0: // Hero Custom
      KhoangCach = 0.0f;
      DoLechAim = 0.0f;
      break;
    case 1: // Elsu
      KhoangCach = 25.0f;
      DoLechAim = 0.432f;
      AimSkill2 = true;
      break;
    case 2: // Gildur
      KhoangCach = 15.0f;
      DoLechAim = 1.064f;
      AimSkill2 = true;
      break;
    case 3: // Grakk
      KhoangCach = 13.0f;
      DoLechAim = 1.085f;
      AimSkill2 = true;
      break;
    case 4: // Slimz
      KhoangCach = 19.0f;
      DoLechAim = 1.692f;
      AimSkill1 = true;
      break;
    case 5: // Yue
      KhoangCach = 14.0f;
      DoLechAim = 0.952f;
      AimSkill2 = true;
      break;
    case 6: // Natalya
      KhoangCach = 13.0f;
      DoLechAim = 1.556f;
      AimSkill2 = true;
      break;
    case 7: // Enzo
      KhoangCach = 11.0f;
      DoLechAim = 0.932f;
      AimSkill2 = true;
      break;
    case 8: // Stuart
      KhoangCach = 17.0f;
      DoLechAim = 1.418f;
      AimSkill1 = true;
      break;
    case 9: // Florentino
      KhoangCach = 9.0f;
      DoLechAim = 0.542f;
      AimSkill1 = true;
      break;
    case 10: // Volkath
      KhoangCach = 11.0f;
      DoLechAim = 1.032f;
      AimSkill2 = true;
      break;
    case 11: // Raz
      KhoangCach = 12.0f;
      DoLechAim = 0.842f;
      AimSkill2 = true;
      break;
    }

    Reset1lan = true;
    ResetDraw = true;
  }

  // Dynamic skill toggles for special heroes
  if (HeroSet == 5) { // Yue
    AimSkill1 = (GetDistanceEnemy <= 10.0f);
  }
  if (HeroSet == 9) { // Florentino
    AimSkill3 = (GetDistanceEnemy <= 7.5f);
  }
  if (HeroSet == 11) { // Raz
    AimSkill1 = (GetDistanceEnemy <= 4.5f);
    AimSkill3 = (GetDistanceEnemy <= 7.0f);
  }
}

void DieuKienCombo() {
  static int selectedAimWhen = aimType;
  static int selecteddraw = drawType;

  const char *aimWhenOptions[] = {"% Máu thấp nhất", "Máu thấp nhất","Khoảng cách gần nhất", "Gần tia nhất [ CHỈ ELSU ]"};
  ImGui::Combo("##Aimtrigger", &selectedAimWhen, aimWhenOptions, IM_ARRAYSIZE(aimWhenOptions));
  ImGui::SameLine();
  ImGui::Text("ĐIỀU KIỆN");

  aimType = selectedAimWhen;
  drawType = selecteddraw;

}

MonoString *CreateMonoString(const char *str) {
  int length = (int)strlen(str);
  int startIndex = 0;
  MonoString *(*String_CreateString)(void *instance, const char *value,
                                     int startIndex, int length) =
      (MonoString * (*)(void *, const char *, int, int))
          GET_OFFSET(oxorany("mscorlib.dll"), oxorany("System"),
                     oxorany("String"), oxorany("CreateString"), 3);
  return String_CreateString(NULL, str, startIndex, length);
}

float ESPRounding = 0.0f;
MonoString *(*GetHero_Icon)(void *instance, bool bSmall);

extern std::string g_playerName;
extern std::string g_prefixName;

std::string g_playerName = "TRUONGMODS"; // Giá trị mặc định
std::string g_prefixName = "AOV";        // Giá trị mặc định

//  ▗▄▄▖ ▗▄▖ ▗▖  ▗▖▗▄▄▄▖▗▄▄▖  ▗▄▖
// ▐▌   ▐▌ ▐▌▐▛▚▞▜▌▐▌   ▐▌ ▐▌▐▌ ▐▌
// ▐▌   ▐▛▀▜▌▐▌  ▐▌▐▛▀▀▘▐▛▀▚▖▐▛▀▜▌
// ▝▚▄▄▖▐▌ ▐▌▐▌  ▐▌▐▙▄▄▖▐▌ ▐▌▐▌ ▐▌
// CAMERA

float (*cam)(void *_this);
float _cam(void *_this) {
  return camera;
  {
    return cam(_this);
  }
}

void (*highrate)(void *instance);
void _highrate(void *instance) { highrate(instance); }

void (*Update)(void *instance);
void _Update(void *instance) {
  if (instance != NULL) {
    _highrate(instance);
  }
  if (lockcam) {
    return;
  }
  return Update(instance);
}
// ▗▖ ▗▖▗▖  ▗▖▗▖    ▗▄▖  ▗▄▄▖▗▖ ▗▖      ▗▄▄▖▗▖ ▗▖▗▄▄▄▖▗▖  ▗▖
// ▐▌ ▐▌▐▛▚▖▐▌▐▌   ▐▌ ▐▌▐▌   ▐▌▗▞▘     ▐▌   ▐▌▗▞▘  █  ▐▛▚▖▐▌
// ▐▌ ▐▌▐▌ ▝▜▌▐▌   ▐▌ ▐▌▐▌   ▐▛▚▖       ▝▀▚▖▐▛▚▖   █  ▐▌ ▝▜▌
// ▝▚▄▞▘▐▌  ▐▌▐▙▄▄▖▝▚▄▞▘▝▚▄▄▖▐▌ ▐▌     ▗▄▄▞▘▐▌ ▐▌▗▄█▄▖▐▌  ▐▌
// UNLOCK SKIN

enum class TdrErrorType {
  TDR_NO_ERROR = 0,
  TDR_ERR_SHORT_BUF_FOR_WRITE = -1,
  TDR_ERR_SHORT_BUF_FOR_READ = -2,
  TDR_ERR_STR_LEN_TOO_BIG = -3,
  TDR_ERR_STR_LEN_TOO_SMALL = -4,
  TDR_ERR_STR_LEN_CONFLICT = -5,
  TDR_ERR_MINUS_REFER_VALUE = -6,
  TDR_ERR_REFER_SURPASS_COUNT = -7,
  TDR_ERR_ARG_IS_NULL = -8,
  TDR_ERR_CUTVER_TOO_SMALL = -9,
  TDR_ERR_CUTVER_CONFILICT = -10,
  TDR_ERR_PARSE_TDRIP_FAILED = -11,
  TDR_ERR_INVALID_TDRIP_VALUE = -12,
  TDR_ERR_INVALID_TDRTIME_VALUE = -13,
  TDR_ERR_INVALID_TDRDATE_VALUE = -14,
  TDR_ERR_INVALID_TDRDATETIME_VALUE = -15,
  TDR_ERR_FUNC_LOCALTIME_FAILED = -16,
  TDR_ERR_INVALID_HEX_STR_LEN = -17,
  TDR_ERR_INVALID_HEX_STR_FORMAT = -18,
  TDR_ERR_INVALID_BUFFER_PARAMETER = -19,
  TDR_ERR_NET_CUTVER_INVALID = -20,
  TDR_ERR_ACCESS_VILOATION_EXCEPTION = -21,
  TDR_ERR_ARGUMENT_NULL_EXCEPTION = -22,
  TDR_ERR_USE_HAVE_NOT_INIT_VARIABLE_ARRAY = -23,
  TDR_ERR_INVALID_FORMAT = -24,
  TDR_ERR_HAVE_NOT_SET_SIZEINFO = -25,
  TDR_ERR_VAR_STRING_LENGTH_CONFILICT = -26,
  TDR_ERR_VAR_ARRAY_CONFLICT = -27,
  TDR_ERR_BAD_TLV_MAGIC = -28,
  TDR_ERR_UNMATCHED_LENGTH = -29,
  TDR_ERR_UNION_SELECTE_FIELD_IS_NULL = -30,
  TDR_ERR_SUSPICIOUS_SELECTOR = -31,
  TDR_ERR_UNKNOWN_TYPE_ID = -32,
  TDR_ERR_LOST_REQUIRED_FIELD = -33,
  TDR_ERR_NULL_ARRAY = -34
  //
};

class TdrReadBuf {
private:
  std::vector<uint8_t> beginPtr;

public:
  bool isUseCache;
};

namespace CSProtocol {
class COMDT_HERO_COMMON_INFO {
public:
  uint32_t getdwHeroID() {
    return *(uint32_t *)((uint64_t)this + GET_FIELDS("AovTdr.dll", "CSProtocol",
                                                     "COMDT_HERO_COMMON_INFO",
                                                     "dwHeroID"));
  };

  uint16_t getwSkinID() {
    return *(uint16_t *)((uint64_t)this + GET_FIELDS("AovTdr.dll", "CSProtocol",
                                                     "COMDT_HERO_COMMON_INFO",
                                                     "wSkinID"));
  };

  void setdwHeroID(uint32_t dwHeroID) {
    *(uint32_t *)((uint64_t)this + GET_FIELDS("AovTdr.dll", "CSProtocol",
                                              "COMDT_HERO_COMMON_INFO",
                                              "dwHeroID")) = dwHeroID;
  };

  void setwSkinID(uint16_t wSkinID) {
    *(uint16_t *)((uint64_t)this + GET_FIELDS("AovTdr.dll", "CSProtocol",
                                              "COMDT_HERO_COMMON_INFO",
                                              "wSkinID")) = wSkinID;
  };
};

struct saveData {
  static uint32_t heroId;
  static uint16_t skinId;
  static bool enable;
  static std::vector<std::pair<COMDT_HERO_COMMON_INFO *, uint16_t>>
      arrayUnpackSkin;

  static void setData(uint32_t hId, uint16_t sId) {
    heroId = hId;
    skinId = sId;
  }

  static void setEnable(bool eb) { enable = eb; }

  static uint32_t getHeroId() { return heroId; }

  static uint16_t getSkinId() { return skinId; }

  static bool getEnable() { return enable; }

  static void resetArrayUnpackSkin() {
    if (!saveData::arrayUnpackSkin.empty()) {
      for (const auto &skinInfo : saveData::arrayUnpackSkin) {
        COMDT_HERO_COMMON_INFO *heroInfo = skinInfo.first;
        uint16_t skinId = skinInfo.second;

        heroInfo->setwSkinID(skinId);
      }
      saveData::arrayUnpackSkin.clear();
    }
  }
};

uint32_t saveData::heroId = 0;
uint16_t saveData::skinId = 0;
bool saveData::enable = false;
std::vector<std::pair<COMDT_HERO_COMMON_INFO *, uint16_t>>
    saveData::arrayUnpackSkin;
} // namespace CSProtocol

void hook_unpack(CSProtocol::COMDT_HERO_COMMON_INFO *instance) {
  if (!CSProtocol::saveData::enable) {
    return;
  }
  if (instance->getdwHeroID() == CSProtocol::saveData::heroId &&
      CSProtocol::saveData::heroId != 0 && CSProtocol::saveData::skinId != 0) {
    CSProtocol::saveData::arrayUnpackSkin.emplace_back(instance,
                                                       instance->getwSkinID());
    instance->setwSkinID(CSProtocol::saveData::skinId);
  }
}

TdrErrorType (*old_unpack)(CSProtocol::COMDT_HERO_COMMON_INFO *instance,
                           TdrReadBuf &srcBuf, int32_t cutVer);
TdrErrorType unpack(CSProtocol::COMDT_HERO_COMMON_INFO *instance,
                    TdrReadBuf &srcBuf, int32_t cutVer) {
  TdrErrorType result = old_unpack(instance, srcBuf, cutVer);
  if (unlockskin) {
    hook_unpack(instance);
  }
  return result;
}

void (*old_RefreshHeroPanel)(void *instance, bool bForceRefreshAddSkillPanel,
                             bool bRefreshSymbol, bool bRefreshHeroSkill);
void (*old_OnClickSelectHeroSkin)(void *instance, uint32_t heroId,
                                  uint32_t skinId);
void OnClickSelectHeroSkin(void *instance, uint32_t heroId, uint32_t skinId) {
  if (unlockskin) {
    if (heroId != 0) {
      old_RefreshHeroPanel(instance, 1, 1, 1);
    }
  }
  old_OnClickSelectHeroSkin(instance, heroId, skinId);
}

bool (*old_IsCanUseSkin)(void *instance, uint32_t heroId, uint32_t skinId);
bool IsCanUseSkin(void *instance, uint32_t heroId, uint32_t skinId) {
  if (unlockskin) {
    if (heroId != 0) {
      CSProtocol::saveData::setData(heroId, skinId);
    }
    return 1;
  }
  return old_IsCanUseSkin(instance, heroId, skinId);
}

uint32_t (*old_GetHeroWearSkinId)(void *instance, uint32_t heroId);
uint32_t GetHeroWearSkinId(void *instance, uint32_t heroId) {
  if (unlockskin) {
    CSProtocol::saveData::setEnable(true);
    return CSProtocol::saveData::skinId;
  }
  return old_GetHeroWearSkinId(instance, heroId);
}

bool (*old_IsHaveHeroSkin)(uintptr_t heroId, uintptr_t skinId,
                           bool isIncludeTimeLimited);
bool IsHaveHeroSkin(uintptr_t heroId, uintptr_t skinId,
                    bool isIncludeTimeLimited = false) {
  if (unlockskin) {
    return 1;
  }
  return old_IsHaveHeroSkin(heroId, skinId, isIncludeTimeLimited);
}

// ▗▄▄▖▗▄▄▖  ▗▄▖ ▗▖  ▗▖      ▗▄▄▖▗▖ ▗▖ ▗▄▖ ▗▄▄▄▖
// ▐▌   ▐▌ ▐▌▐▌ ▐▌▐▛▚▞▜▌     ▐▌   ▐▌ ▐▌▐▌ ▐▌  █
//  ▝▀▚▖▐▛▀▘ ▐▛▀▜▌▐▌  ▐▌     ▐▌   ▐▛▀▜▌▐▛▀▜▌  █
// ▗▄▄▞▘▐▌   ▐▌ ▐▌▐▌  ▐▌     ▝▚▄▄▖▐▌ ▐▌▐▌ ▐▌  █
//  SPAM CHAT

void (*_SendInBattleMsg_InputChat)(const char *content, uint8_t camp);
void SendInBattleMsg_InputChat(const char *content, uint8_t camp) {
  if (content != NULL) {
    NSString *nsContent = [NSString stringWithUTF8String:content];
    if (spamchat) {
      for (int i = 0; i < 10; i++) {
        _SendInBattleMsg_InputChat(content, camp);
      }
    } else {
      _SendInBattleMsg_InputChat(content, camp);
    }
  }
  return;
}

// ▗▄▄▄   ▗▄▖ ▗▄▄▄▖     ▗▄▄▄▖▗▄▄▄▖▗▖  ▗▖     ▗▄▄▄   ▗▄▖ ▗▄▄▄▖
// ▐▌  █ ▐▌ ▐▌  █         █  ▐▌   ▐▛▚▖▐▌     ▐▌  █ ▐▌ ▐▌  █
// ▐▌  █ ▐▌ ▐▌  █         █  ▐▛▀▀▘▐▌ ▝▜▌     ▐▌  █ ▐▛▀▜▌  █
// ▐▙▄▄▀ ▝▚▄▞▘▗▄█▄▖       █  ▐▙▄▄▖▐▌  ▐▌     ▐▙▄▄▀ ▐▌ ▐▌▗▄█▄▖
// DOI TEN DAI

int (*CheckRoleName)(void *instance, MonoString *inputname);
int _CheckRoleName(void *instance, MonoString *inputname) {
  if (instance != NULL) {
    int giatri = CheckRoleName(instance, inputname);
    if (doiten) {
      if (giatri == 2) {
        return 0;
      }
      if (giatri == 3) {
        return 0;
      }
    }
    return giatri;
  }
  return CheckRoleName(instance, inputname);
}

MonoString *(*_RemoveSpace)(void *instance, MonoString *inputname);
MonoString *RemoveSpace(void *instance, MonoString *inputname) {
  if (instance != NULL) {
    if (doiten) {
      return inputname;
    }
  }
  return _RemoveSpace(instance, inputname);
}

// ▗▖ ▗▖▗▖  ▗▖▗▖    ▗▄▖  ▗▄▄▖▗▖ ▗▖     ▗▖  ▗▖▗▖ ▗▖▗▄▄▄▖
// ▐▌ ▐▌▐▛▚▖▐▌▐▌   ▐▌ ▐▌▐▌   ▐▌▗▞▘     ▐▛▚▖▐▌▐▌ ▐▌  █
// ▐▌ ▐▌▐▌ ▝▜▌▐▌   ▐▌ ▐▌▐▌   ▐▛▚▖      ▐▌ ▝▜▌▐▌ ▐▌  █
// ▝▚▄▞▘▐▌  ▐▌▐▙▄▄▖▝▚▄▞▘▝▚▄▄▖▐▌ ▐▌     ▐▌  ▐▌▝▚▄▞▘  █
// UNLOCK NUT

bool unlockbuttoncustom;

static int selectedValue; // Lưu giá trị được chọn
static const char *options[] = {"Mặc Định Theo Skin",
                                "Krixi Phù Thủy Thời Không",
                                "Zephys Kỷ Nguyên Hổ Phách | Anime",
                                "Veera Thất Sát - Thượng Sinh",
                                "Violet Thứ Nguyên Vệ Thần",
                                "Violet Thần Long Tỷ Tỷ",
                                "Violet Nobara Kugisaki",
                                "Yorn Conan Edogawa",
                                "Butterfly Kim Ngư Thần Nữ",
                                "Butterfly Nữ Thần Khởi Nguyên",
                                "Butterfly Bình Minh Tận Thế",
                                "Alice Eternal Sailor Chibi Moon",
                                "Airi Thứ Nguyên Vệ Thần",
                                "Murad Tuyệt Thế Thần Binh",
                                "Murad Thiên Luân Kiếm Thánh",
                                "Hayate Siêu Đạo Chích Kid",
                                "Valhein Thứ Nguyên Vệ Thần",
                                "Ilumia Lưỡng Nghi Long Hậu",
                                "Paine Megumi Fushiguro",
                                "Lauriel Thứ Nguyên Vệ Thần",
                                "Nakroth Killua",
                                "Nakroth Quỷ Thương Liệp Đế",
                                "Nakroth Bạch Diện Chiến Thương",
                                "Điêu Thuyền Eternal Sailor Moon",
                                "Yena Huyền Cửu Thiên",
                                "Yena Trấn Yêu Thần Lộc",
                                "Raz Gon",
                                "Tulen Satoru Gojo",
                                "Rouie Lữ hành Thời không",
                                "Enzo Kurapika",
                                "Eland'orr Tuxedo Mask",
                                "Tel'Annas Thứ Nguyên Vệ Thần",
                                "Tel'Annas Lân Quang Thánh Điệu",
                                "Tel'annas Kỷ Nguyên Hổ Phách",
                                "Liliana Ma Pháp Tối Thượng",
                                "Veres Lưu Ly Long Mẫu",
                                "Florentino Kỷ Nguyên Hổ Phách",
                                "Capheny Càn Nguyên Điện Chủ",
                                "Capheny Bugcag Assemble",
                                "Aya Công Chúa Cầu Vồng",
                                "Bijan Lữ Hành Thời Không",
                                "Biron Yuji Itadori",
                                "Bolt Baron Thiên Phủ - Tư Mệnh",
                                "Billow Thiên Tướng - Độ Ách",
                                "Dolia Nhật Ký Rung Động",
                                "Iggy Rimuru Tempest",
                                "Qi Milim Nava",
                                "Nakroth Thứ Nguyên Vệ Thần",
                                "Elandorr Chuyến Tàu Mơ Ước",
                                "Elsu Chuyến Tàu Mơ Ước",
                                "Aya Cinnamorolls Dream",
                                "Arthur Pompompurins",
                                "Natalya Kuromis Hear",
                                "Veera My Melodys Love",
                                "Triệu Vân Chiến Thần Vô Song",                                
                                "Billow T-Rex Bất Bại"};

static int heroid2, skinid2;
int (*_Buttonid)(void *ins);
int Buttonid(void *ins) {
  if (unlockbutton) {
    int heroId = (heroid2 == 0) ? CSProtocol::saveData::getHeroId() : heroid2;
    int skinId = (skinid2 == 0) ? CSProtocol::saveData::getSkinId() : skinid2;
    if (unlockbutton) {
      int rdwbutton2 = heroId * 100 + skinId;
      return rdwbutton2;
    }
  }
  return _Buttonid(ins);
}
bool (*_IsOpen)(void *instance);
bool IsOpen(void *instance) {
  if (unlockbutton) {
    if (instance != NULL) {
      return true;
    }
  }
}

static bool tkms = false;

// ▗▄▄▄▖▗▖ ▗▖▗▖  ▗▖ ▗▄▄▖
//   █  ▐▌▗▞▘▐▛▚▞▜▌▐▌
//   █  ▐▛▚▖ ▐▌  ▐▌ ▝▀▚▖
//   █  ▐▌ ▐▌▐▌  ▐▌▗▄▄▞▘
// TKMS

int (*_getactorhp)(void *instance);
int getactorhp(void *instance) { return _getactorhp(instance); }

void (*_setactorhp)(void *instance, int value);
void setactorhp(void *instance, int value) {
  if (instance != NULL && tkms && _getactorhp(instance) == 9000 &&
      ((uintptr_t)instance & 0xFFFFFFFF) >> 24 != 0x161) {
    value = 0;
  }
  _setactorhp(instance, value);
}

// ▗▄▖ ▗▖ ▗▖▗▄▄▄▖ ▗▄▖      ▗▖ ▗▖▗▄▄▄▖▗▖  ▗▖
// ▐▌ ▐▌▐▌ ▐▌  █  ▐▌ ▐▌     ▐▌ ▐▌  █  ▐▛▚▖▐▌
// ▐▛▀▜▌▐▌ ▐▌  █  ▐▌ ▐▌     ▐▌ ▐▌  █  ▐▌ ▝▜▌
// ▐▌ ▐▌▝▚▄▞▘  █  ▝▚▄▞▘     ▐▙█▟▌▗▄█▄▖▐▌  ▐▌
// AUTO WIN

void (*Autowin)(void *player, int hpPercent, int epPercent);
void _Autowin(void *player, int hpPercent, int epPercent) {
  if (player != NULL && autowin) {
    hpPercent = -999999;
    epPercent = -999999;
  }
  Autowin(player, hpPercent, epPercent);
}
// ▗▖ ▗▖▗▖  ▗▖▗▖    ▗▄▖  ▗▄▄▖▗▖ ▗▖     ▗▄▄▄▖▗▄▄▖      ▗▖ ▗▖ ▗▄▖
// ▐▌ ▐▌▐▛▚▖▐▌▐▌   ▐▌ ▐▌▐▌   ▐▌▗▞▘       █  ▐▌ ▐▌     ▐▌ ▐▌▐▌ ▐▌
// ▐▌ ▐▌▐▌ ▝▜▌▐▌   ▐▌ ▐▌▐▌   ▐▛▚▖        █  ▐▛▀▚▖     ▐▛▀▜▌▐▛▀▜▌
// ▝▚▄▞▘▐▌  ▐▌▐▙▄▄▖▝▚▄▞▘▝▚▄▄▖▐▌ ▐▌       █  ▐▙▄▞▘     ▐▌ ▐▌▐▌ ▐▌
// UNLOCK TB HA

int Changli = 0;
int Jinhsi = 0;
int Iuno = 0;
int Yea_miko = 0;
int Elysia = 0;
int Nahida = 0;
long long Maiyeuem = 0;

void *(*_Mahiru)(void *instance, int inPlayerID);
void *Mahiru(void *instance, int inPlayerID)
{
    if (instance != NULL)
    {
        Maiyeuem = *(long long *)((uintptr_t)instance + UL_ulAccountUid);
    }
    return _Mahiru(instance, inPlayerID);
}

void *(*_Emilia)(void *instance, int delta);
void *Emilia(void *instance, int delta)
{
    void *GetPlayer = _Emilia(instance, delta);
    if (GetPlayer != NULL)
    {
        long long All_Waifu = *(long long *)((uint64_t)GetPlayer + UL_PlayerUId);
        if (All_Waifu == Maiyeuem && (Changli > 0 || Jinhsi > 0 || Iuno > 93000))
        {
            *(int *)((uint64_t)GetPlayer + UL_broadcastID) = Changli;
            *(int *)((uint64_t)GetPlayer + UL_PersonalButtonID) = Jinhsi;
            *(int *)((uint64_t)GetPlayer + UL_usingSoldierSkinID) = Iuno;
        }
    }
    return GetPlayer;
}

const char *Nakano_Miku[] = {
    "Mặc Định", "Kill Triệu Vân Thần Tài", "Kill Hayate Tu Di Thánh Đế", "Kill Ngộ Tân Niên Võ Thần",
    "Kill Điêu Thuyền Eternal Sailor Moon", "Kill Alicu Chibi Moon", "Kill Elandorr Tuxedo", "Kill Butterfly Thánh Nữ Khởi Nguyên",
    "Kill Enzo Kurapika", "Kill Nak Killua", "Kill Raz Gon", "Kill Yena Huyền Cửu Thiên", "Kill Airi Thứ Nguyên",
    "Kill Murad Thần Binh", "Kill Grakk Thần Ẩm Thực", "Kill Veres Lưu Ly Long Mẫu", "Kill Nak Quỷ Thương",
    "Kill Aya Công Chúa Cầu Vồng", "Kill Nak Producer Tia Chớp", "Kill Krixi Thời Tri Kỳ Lữ", "Kill Nak Bạch Diện Chiến Thương",
    "Kill Veera Phù Thủy Hội Họa", "Kill Lili Ma Pháp Tối Thượng", "Kill Biron Yuji Itadori", "Kill Tulen Gojo",
    "Kill Ilumia Lưỡng Nghi Long Hậu", "Kill Vio Thứ Nguyên", "Kill Cap Càn Nguyên Điện Chủ", "Kill Allain Lân Sư Vũ Thần",
    "Kill Tel'Annas Lân Quang Thánh Điệu", "Kill Murad Tiên Dế", "Kill Vio Nobara", "Kill Paine Megumi", "Kill Butterfly Bình Minh Tận Thế",
    "Kill Val Vệ Thần", "Kill Kaine Thợ Săn Chính Nghĩa", "Kill Tel'Annas Thứ Nguyên vệ Thần", "Kill Stuart Siêu Trùm Phản Diện",
    "Kill Yorn Edogawa Conan", "Kill Hayate Kaito Kid", "Kill Capheny Bugcag Assemble", "Kill Bijan Thời Tri Kỳ Lữ", "Kill Nak Thứ Nguyên Vệ Thần",
    "Kill Elsu Chuyến Tàu Mơ Ước", "Kill Elandorr Chuyến Tàu Mơ Ước", "Kill Lauriel Thứ Nguyên Vệ Thần", "Kill iggy Rimuru Tempest", "Kill Qi Milim Nava",
    "Kill Aya Cinnamoroll dream", "Kill Arthur Pompompurin's Oath", "Kill Nata Kuromi's Heart", "Kill Veera My Melody's Love", "Kill Yue Trầm Kim Ánh Nguyệt"};

const int KillNotifyID[] = {
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
    10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
    20, 22, 23, 24, 25, 26, 28, 29, 30, 31,
    21, 33, 34, 32, 27, 37, 38, 42, 35, 36,
    43, 44, 45, 46, 47, 49, 50, 51, 52, 53,
    54, 55, 48};

void Killnottify()
{
    if (ImGui::Combo("Thông Báo Hạ", &Yea_miko, Nakano_Miku, IM_ARRAYSIZE(Nakano_Miku)))
    {
        if (Yea_miko >= 0 && Yea_miko < IM_ARRAYSIZE(KillNotifyID))
        {
            Changli = KillNotifyID[Yea_miko];
        }
    }
}

const char *Nakano_itsuki[] = {
    "Mặc ĐỊnh", "Nút Lauriel Vệ Thần", "Nút Điêu Thuyền Sailor Moon", "Nút Elandorr Tuxedo",
    "Nút Vio Thần Long Tỷ Tỷ", "Nút Alicu Chibi Moon", "Nút Butterfly Kim Ngư Thần Nữ", "Nút Butterfly Thánh Nữ Khởi Nguyên",
    "Nút Raz Gon", "Nút Enzo Kurapika", "Nút Nak Killua", "Nút Murad Tuyệt Thế Thần Binh", "Nút Airi Vệ Thần", "Nút Yena Huyền Cửu Thiên",
    "Nút Veres Lưu Ly Long Mẫu", "Nút Nak Quỷ Thương Liệp Đế", "Nút Aya Công Chúa Cầu Vồng", "Nút Nak Bạch Diện Chiến Thương",
    "Nút Krixi Thời Tri Kỳ Lữ", "Nút Lili Ma Pháp Tối Thượng", "Nút Biron Yuji Itadori", "Nút Tulen Gojo", "Nút Ilumia Lưỡng Nghi Long Hậu",
    "Nút Vio Vệ Thần", "Nút Cap Càn Nguyên Điện Chủ", "Nút Billow Thiên Tướng - Độ Ách", "Nút Baron Thiên Phủ-Tư Mệnh",
    "Nút Veera Thất Sát Thượng Sinh", "Nút Yena Trấn Yêu Thần Lộc", "Nút Tel'Annas Lân Quang Thánh Điệu", "Nút Murad Tiên Dế",
    "Nút Vio Nobara", "Nút Paine Megumi", "Nút Butterfly Bình Minh Tận thế", "Nút Zephys kỷ Nguyên Hổ Phách", "Nút Flo Kỷ Nguyên Hổ Phách",
    "Nút Tel Kỷ Nguyên Hổ Phách", "Nút Bijan Thời Tri Kỳ Lữ", "Nút Rouie Thời Tri Kỳ Lữ", "Nút Val Vệ Thần", "Nút Tel'Annas Thứ Nguyên vệ Thần",
    "Nút Stuart Siêu Trùm Phản Diện", "Nút Yorn Edogawa Conan", "Nút Hayate Kaito Kid", "Nút Capheny Bugcag Assemble", "Nút Dolia Nhật Ký Tình Yêu",
    "Nút Nak Thứ Nguyên Vệ Thần", "Nút Elandorr Chuyến tàu Mơ Ước", "Nút iggy Rimuru Tempest", "Nút Qi Milim Nava", "Nút Triệu Vân Chiến Thần Vô Song",
    "Nút Billow T-Rex Bất Bại", "Nút Arthur Pompompurin's Oath", "Nút Nata Kuromi's Heart", "Nút Aya Cinnamoroll dream", "Nút Veera My Melody's Love",
    "Nút Yue Trầm Kim Ánh Nguyệt"};

const int ButtonSkinID[] = {
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
    10, 11, 12, 13, 14, 15, 16, 17, 19, 21,
    22, 23, 24, 26, 27, 28, 29, 30, 31, 32, 20,
    34, 35, 33, 36, 37, 38, 39, 40, 25, 44, 42,
    45, 46, 49, 47, 52, 53, 54, 55, 43, 56, 58,
    59, 60, 61, 48};

void Skinbutton()
{
    if (ImGui::Combo("Nút Bấm", &Elysia, Nakano_itsuki, IM_ARRAYSIZE(Nakano_itsuki)))
    {
        if (Elysia >= 0 && Elysia < IM_ARRAYSIZE(ButtonSkinID))
        {
            Jinhsi = ButtonSkinID[Elysia];
        }
    }
}

const char *Cartethyia[] = {
    "Mặc ĐỊnh", "Lính Thám tử", "Lính Yêu Tinh", "Lính Cinnamon Dessert"};

const int SoldierSkinID[] = {
    93000, 93001, 93002, 93003};

void Skinsoldier()
{
    if (ImGui::Combo("Skin Lính", &Nahida, Cartethyia, IM_ARRAYSIZE(Cartethyia)))
    {
        if (Nahida >= 0 && Nahida < IM_ARRAYSIZE(SoldierSkinID))
        {
            Iuno = SoldierSkinID[Nahida];
        }
    }
}

bool unlock2;
void *(*get_VHostLogic)();
bool (*TryShowLegendRank)(void *instance, bool canShowProficiency,
                          void *elementGo, void *playerData, int adCode,
                          int rankNo, int medalType);
bool _TryShowLegendRank(void *instance, bool canShowProficiency,
                        void *elementGo, void *playerData, int adCode,
                        int rankNo, int medalType) {
  if (modpro5) {
    if (instance != NULL) {
      adCode = 505;       // top vietnam
      rankNo = rankcuc;   // top 1,2,3.........
      medalType = maucuc; // 4: vàng , 3 tím , 2 xanh dương,1 xanh lá,0: lỏ
    }
  }
  return TryShowLegendRank(instance, canShowProficiency, elementGo, playerData,
                           adCode, rankNo, medalType);
}
bool (*IsShowLegendRankMode)(void *instance, void *levelContext);
bool _IsShowLegendRankMode(void *instance, void *levelContext) {
  if (modpro5) {
    if (instance != NULL) {
      return true;
    }
  }
  return IsShowLegendRankMode(instance, levelContext);
}
// pro5 top
void *(*unpackTop)(void *instance, void *srcBuf, long cutVer);
void *_unpackTop(void *instance, void *srcBuf, long cutVer) {
  if (modpro5) {
    if (instance != NULL) {
      void *call = unpackTop(instance, srcBuf, cutVer);
      int dwIsTop = *(int *)((uintptr_t)instance + 0x10);
      int dwAdCode = *(int *)((uintptr_t)instance + 0x14);
      int dwRank = *(int *)((uintptr_t)instance + 0x18);
      *(int *)((uintptr_t)instance + 0x14) = 505; // top vietnam
      *(int *)((uintptr_t)instance + 0x10) =
          pro5maucuc; // 1 cục vàng , 0 cục tím,xanh........
      *(int *)((uintptr_t)instance + 0x18) =
          rankcuc; // vị trí hiện tại, ví dụ đang top 1,2,3 vùng miền vn
      return call;
    }
  }
  return unpackTop(instance, srcBuf, cutVer);
}
bool (*CanPlayerShowLegendRank)(void *instance, void *playerData,
                                void *dataProvider, int targetCampId,
                                bool isWarmBattle, void **actorMeta,
                                int *adCode, int *rankNo, int *medalType);
bool _CanPlayerShowLegendRank(void *instance, void *playerData,
                              void *dataProvider, int targetCampId,
                              bool isWarmBattle, void **actorMeta, int *adCode,
                              int *rankNo, int *medalType) {
  if (modpro5) {
    if (instance != NULL) {
      void *VHostLogic = get_VHostLogic();
      int playerID = 0;
      if (VHostLogic != nullptr) {
        playerID = *(int *)((uintptr_t)VHostLogic + 0x18);
      }
      if (playerData != nullptr) {
        int PlayerID = *(int *)((uintptr_t)playerData + 0x10);
        if (PlayerID == playerID) {
          return true;
        }
      }
    }
  }
  return CanPlayerShowLegendRank(instance, playerData, dataProvider,
                                 targetCampId, isWarmBattle, actorMeta, adCode,
                                 rankNo, medalType);
}

void *(*_GetMasterRoleInfo)(void *);
void *GetMasterRoleInfo(void *instance) {
  if (modpro5) {
    if (instance != NULL && modpro5) {
      void *CRoleInfo = _GetMasterRoleInfo(instance);
      if (CRoleInfo) {
        *(int *)((uint64_t)CRoleInfo + 0x354) = soluongsao; // số lượng sao
        *(int *)((uint64_t)CRoleInfo + 0x36C) = soluongsao;

        *(uint8_t *)((uint64_t)CRoleInfo + 0x358) = pro5rank; // rank hiện tại
        *(uint8_t *)((uint64_t)CRoleInfo + 0x359) =
            pro5rank; // rank lịch sử cao nhất
        *(uint8_t *)((uint64_t)CRoleInfo + 0x35A) =
            pro5rank; // rank mùa này cao nhất

        *(int *)((uint64_t)CRoleInfo + 0x378) =
            dauan; // số lượng mùa cao thủ trở lên
        *(int *)((uint64_t)CRoleInfo + 0x35C) = toptd; // top thách đấu
        *(int *)((uint64_t)CRoleInfo + 0x360) = toptd; // top thách đấu
        *(int *)((uint64_t)CRoleInfo + 0x364) = toptd; // top thách đấu
        return CRoleInfo;
      }
    }
  }
  return _GetMasterRoleInfo(instance);
}

void *(*_GetCurrentRankDetail)(void *);
void *GetCurrentRankDetail(void *instance) {
  if (modpro5) {
    if (instance != NULL && modpro5) {
      void *rankdetail = _GetCurrentRankDetail(instance);
      if (rankdetail) {
        *(int *)((uint64_t)rankdetail + 0x1C) = soluongsao;
        return rankdetail;
      }
    }
  }
  return _GetCurrentRankDetail(instance);
}

void (*_SetLegendTitleComplete)(void *medalimage, void *rankingtext,
                                void *titletext, void *titlecnttext,
                                int titleadCode, int heroid, int ranking,
                                int titlecnt, bool hideGIS,
                                bool isAlsoSetGoVisible,
                                MonoString *normalTitle, MonoString *topTitle);
void SetLegendTitleComplete(void *medalimage, void *rankingtext,
                            void *titletext, void *titlecnttext,
                            int titleadCode, int heroid, int ranking,
                            int titlecnt, bool hideGIS, bool isAlsoSetGoVisible,
                            MonoString *normalTitle, MonoString *topTitle) {
  if (modpro5) {
    ranking = 1;
    titleadCode = 505;
    heroid = 599;
  }
  _SetLegendTitleComplete(medalimage, rankingtext, titletext, titlecnttext,
                          titleadCode, heroid, ranking, titlecnt, hideGIS,
                          isAlsoSetGoVisible, normalTitle, topTitle);
}

bool modpro5;
int pro5rank = 32;
int soluongsao = 131;
int dauan = 0;
int toptd = 1;
int rankcuc = 1;
int maucuc;
int pro5maucuc;
bool rankcaothu;
bool rankchientuong;
bool rankchienthan = true;
bool rankthuong5s;
bool rankthuong4s;
bool rankthuong3s;
bool thachdau = true;
int selectedValue3 = 0;
int selectedValue4 = 0;

static const char *options3[] = {
    "Rank Thách Đấu", "Rank Chiến Thần", "Rank Chiến Tướng", "Rank Cao Thủ",
    "Rank Tinh Anh",  "Rank Kim Cương",  "Rank Bạch Kim",    "Rank Vàng",
    "Rank Bạc",       "Rank Đồng"};
static const char *options4[] = {"Top Sever | Vàng",
                                 "Top VN | Đỏ",
                                 "Top VN | Tím",
                                 "Top Miền | Xanh Dương",
                                 "Top Vùng | Xanh Lá",
                                 "Top Xã | Đen",
                                 "Không"};

- (void)ghost {
  UIView *mainView =
      [UIApplication sharedApplication].windows[0].rootViewController.view;

  UIButton *InvisibleMenuButton =
      [UIButton buttonWithType:UIButtonTypeRoundedRect];
  InvisibleMenuButton.frame = CGRectMake(
      mainView.frame.size.width / 2, mainView.frame.size.height / 2, 55, 55);
  InvisibleMenuButton.backgroundColor = [UIColor clearColor];
  [InvisibleMenuButton addTarget:self
                          action:@selector(buttonDragged1:withEvent:)
                forControlEvents:UIControlEventTouchDragInside];
  UITapGestureRecognizer *tapGestureRecognizer =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(BBone:)];
  [InvisibleMenuButton addGestureRecognizer:tapGestureRecognizer];
  [[UIApplication sharedApplication].windows[0].rootViewController.view
      addSubview:InvisibleMenuButton];
  BBone = [[UIButton alloc]
      initWithFrame:CGRectMake(mainView.frame.size.width / 2,
                               mainView.frame.size.height / 2, 55, 55)];
  BBone.backgroundColor = [UIColor colorWithRed:0.00
                                          green:0.00
                                           blue:0.00
                                          alpha:0.50];
  [BBone setTitle:NSCRYPT("MUA") forState:UIControlStateNormal];
  [BBone.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
  [BBone setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
  BBone.layer.cornerRadius = BBone.frame.size.width / 2.0;
  BBone.clipsToBounds = YES;
  [hideRecordView addSubview:BBone];
}

- (void)BBone:(UITapGestureRecognizer *)tapGestureRecognizer {
  if (tapGestureRecognizer.state == UIGestureRecognizerStateEnded) {
    BBone.selected = !BBone.selected;
    if (BBone.selected) {
      [BBone setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
      [[maintool sharemain] autobando];
    } else {
      [BBone setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
      [[maintool sharemain] autobando];
    }
  }
}

- (void)buttonDragged1:(UIButton *)button withEvent:(UIEvent *)event {
  UITouch *touch = [[event touchesForView:button] anyObject];

  CGPoint previousLocation = [touch previousLocationInView:button];
  CGPoint location = [touch locationInView:button];
  CGFloat delta_x = location.x - previousLocation.x;
  CGFloat delta_y = location.y - previousLocation.y;

  button.center =
      CGPointMake(button.center.x + delta_x, button.center.y + delta_y);

  CGRect mainFrame = [UIApplication sharedApplication]
                         .windows[0]
                         .rootViewController.view.bounds;
  if (button.center.x < 0)
    button.center = CGPointMake(0, button.center.y);
  if (button.center.y < 0)
    button.center = CGPointMake(button.center.x, 0);
  if (button.center.y > mainFrame.size.height)
    button.center = CGPointMake(button.center.x, mainFrame.size.height);
  if (button.center.x > mainFrame.size.width)
    button.center = CGPointMake(mainFrame.size.width, button.center.y);

  BBone.center = button.center;
  BBone.frame = button.frame;
}

- (void)ghost2 {
  UIView *mainView =
      [UIApplication sharedApplication].windows[0].rootViewController.view;

  UIButton *InvisibleMenuButton =
      [UIButton buttonWithType:UIButtonTypeRoundedRect];
  InvisibleMenuButton.frame = CGRectMake(
      mainView.frame.size.width / 2, mainView.frame.size.height / 2, 55, 55);
  InvisibleMenuButton.backgroundColor = [UIColor clearColor];
  [InvisibleMenuButton addTarget:self
                          action:@selector(buttonDragged2:withEvent:)
                forControlEvents:UIControlEventTouchDragInside];
  UITapGestureRecognizer *tapGestureRecognizer =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(BBone2:)];
  [InvisibleMenuButton addGestureRecognizer:tapGestureRecognizer];
  [[UIApplication sharedApplication].windows[0].rootViewController.view
      addSubview:InvisibleMenuButton];
  BBone2 = [[UIButton alloc]
      initWithFrame:CGRectMake(mainView.frame.size.width / 2,
                               mainView.frame.size.height / 2, 55, 55)];
  BBone2.backgroundColor = [UIColor colorWithRed:0.00
                                           green:0.00
                                            blue:0.00
                                           alpha:0.50];
  [BBone2 setTitle:NSCRYPT("MUA") forState:UIControlStateNormal];
  [BBone2.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
  [BBone2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
  BBone2.layer.cornerRadius = BBone2.frame.size.width / 2.0;
  BBone2.clipsToBounds = YES;
  [hideRecordView addSubview:BBone2];
}

- (void)BBone2:(UITapGestureRecognizer *)tapGestureRecognizer {
  if (tapGestureRecognizer.state == UIGestureRecognizerStateEnded) {
    BBone2.selected = !BBone2.selected;
    if (BBone2.selected) {
      [BBone2 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
      [[maintool sharemain] autobando2];
    } else {
      [BBone2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
      [[maintool sharemain] autobando2];
    }
  }
}

- (void)buttonDragged2:(UIButton *)button withEvent:(UIEvent *)event {
  UITouch *touch = [[event touchesForView:button] anyObject];

  CGPoint previousLocation = [touch previousLocationInView:button];
  CGPoint location = [touch locationInView:button];
  CGFloat delta_x = location.x - previousLocation.x;
  CGFloat delta_y = location.y - previousLocation.y;

  button.center =
      CGPointMake(button.center.x + delta_x, button.center.y + delta_y);

  CGRect mainFrame = [UIApplication sharedApplication]
                         .windows[0]
                         .rootViewController.view.bounds;
  if (button.center.x < 0)
    button.center = CGPointMake(0, button.center.y);
  if (button.center.y < 0)
    button.center = CGPointMake(button.center.x, 0);
  if (button.center.y > mainFrame.size.height)
    button.center = CGPointMake(button.center.x, mainFrame.size.height);
  if (button.center.x > mainFrame.size.width)
    button.center = CGPointMake(mainFrame.size.width, button.center.y);

  BBone2.center = button.center;
  BBone2.frame = button.frame;
}

- (void)ghostbenphai {
  UIView *mainView =
      [UIApplication sharedApplication].windows[0].rootViewController.view;

  UIButton *InvisibleMenuButton =
      [UIButton buttonWithType:UIButtonTypeRoundedRect];
  InvisibleMenuButton.frame = CGRectMake(
      mainView.frame.size.width / 2, mainView.frame.size.height / 2, 55, 55);
  InvisibleMenuButton.backgroundColor = [UIColor clearColor];
  [InvisibleMenuButton addTarget:self
                          action:@selector(buttonDraggedbenphai1:withEvent:)
                forControlEvents:UIControlEventTouchDragInside];
  UITapGestureRecognizer *tapGestureRecognizer =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(BBonebenphai:)];
  [InvisibleMenuButton addGestureRecognizer:tapGestureRecognizer];
  [[UIApplication sharedApplication].windows[0].rootViewController.view
      addSubview:InvisibleMenuButton];
  BBonebenphai = [[UIButton alloc]
      initWithFrame:CGRectMake(mainView.frame.size.width / 2,
                               mainView.frame.size.height / 2, 55, 55)];
  BBonebenphai.backgroundColor = [UIColor colorWithRed:0.00
                                                 green:0.00
                                                  blue:0.00
                                                 alpha:0.50];
  [BBonebenphai setTitle:NSCRYPT("MUA") forState:UIControlStateNormal];
  [BBonebenphai.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
  [BBonebenphai setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
  BBonebenphai.layer.cornerRadius = BBonebenphai.frame.size.width / 2.0;
  BBonebenphai.clipsToBounds = YES;
  [hideRecordView addSubview:BBonebenphai];
}

- (void)BBonebenphai:(UITapGestureRecognizer *)tapGestureRecognizer {
  if (tapGestureRecognizer.state == UIGestureRecognizerStateEnded) {
    BBonebenphai.selected = !BBonebenphai.selected;
    if (BBonebenphai.selected) {
      [BBonebenphai setTitleColor:[UIColor greenColor]
                         forState:UIControlStateNormal];
      [[maintool sharemain] autobandobenphai];
    } else {
      [BBonebenphai setTitleColor:[UIColor redColor]
                         forState:UIControlStateNormal];
      [[maintool sharemain] autobandobenphai];
    }
  }
}

- (void)buttonDraggedbenphai1:(UIButton *)button withEvent:(UIEvent *)event {
  UITouch *touch = [[event touchesForView:button] anyObject];

  CGPoint previousLocation = [touch previousLocationInView:button];
  CGPoint location = [touch locationInView:button];
  CGFloat delta_x = location.x - previousLocation.x;
  CGFloat delta_y = location.y - previousLocation.y;

  button.center =
      CGPointMake(button.center.x + delta_x, button.center.y + delta_y);

  CGRect mainFrame = [UIApplication sharedApplication]
                         .windows[0]
                         .rootViewController.view.bounds;
  if (button.center.x < 0)
    button.center = CGPointMake(0, button.center.y);
  if (button.center.y < 0)
    button.center = CGPointMake(button.center.x, 0);
  if (button.center.y > mainFrame.size.height)
    button.center = CGPointMake(button.center.x, mainFrame.size.height);
  if (button.center.x > mainFrame.size.width)
    button.center = CGPointMake(mainFrame.size.width, button.center.y);

  BBonebenphai.center = button.center;
  BBonebenphai.frame = button.frame;
}

- (void)ghostbenphai2 {
  UIView *mainView =
      [UIApplication sharedApplication].windows[0].rootViewController.view;

  UIButton *InvisibleMenuButton =
      [UIButton buttonWithType:UIButtonTypeRoundedRect];
  InvisibleMenuButton.frame = CGRectMake(
      mainView.frame.size.width / 2, mainView.frame.size.height / 2, 55, 55);
  InvisibleMenuButton.backgroundColor = [UIColor clearColor];
  [InvisibleMenuButton addTarget:self
                          action:@selector(buttonDraggedbenphai2:withEvent:)
                forControlEvents:UIControlEventTouchDragInside];
  UITapGestureRecognizer *tapGestureRecognizer =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(BBonebenphai2:)];
  [InvisibleMenuButton addGestureRecognizer:tapGestureRecognizer];
  [[UIApplication sharedApplication].windows[0].rootViewController.view
      addSubview:InvisibleMenuButton];
  BBonebenphai2 = [[UIButton alloc]
      initWithFrame:CGRectMake(mainView.frame.size.width / 2,
                               mainView.frame.size.height / 2, 55, 55)];
  BBonebenphai2.backgroundColor = [UIColor colorWithRed:0.00
                                                  green:0.00
                                                   blue:0.00
                                                  alpha:0.50];
  [BBonebenphai2 setTitle:NSCRYPT("MUA") forState:UIControlStateNormal];
  [BBonebenphai2.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
  [BBonebenphai2 setTitleColor:[UIColor redColor]
                      forState:UIControlStateNormal];
  BBonebenphai2.layer.cornerRadius = BBonebenphai2.frame.size.width / 2.0;
  BBonebenphai2.clipsToBounds = YES;
  [hideRecordView addSubview:BBonebenphai2];
}

- (void)BBonebenphai2:(UITapGestureRecognizer *)tapGestureRecognizer {
  if (tapGestureRecognizer.state == UIGestureRecognizerStateEnded) {
    BBonebenphai2.selected = !BBonebenphai2.selected;
    if (BBonebenphai2.selected) {
      [BBonebenphai2 setTitleColor:[UIColor greenColor]
                          forState:UIControlStateNormal];
      [[maintool sharemain] autobandobenphai];
    } else {
      [BBonebenphai2 setTitleColor:[UIColor redColor]
                          forState:UIControlStateNormal];
      [[maintool sharemain] autobandobenphai];
    }
  }
}

- (void)buttonDraggedbenphai2:(UIButton *)button withEvent:(UIEvent *)event {
  UITouch *touch = [[event touchesForView:button] anyObject];

  CGPoint previousLocation = [touch previousLocationInView:button];
  CGPoint location = [touch locationInView:button];
  CGFloat delta_x = location.x - previousLocation.x;
  CGFloat delta_y = location.y - previousLocation.y;

  button.center =
      CGPointMake(button.center.x + delta_x, button.center.y + delta_y);

  CGRect mainFrame = [UIApplication sharedApplication]
                         .windows[0]
                         .rootViewController.view.bounds;
  if (button.center.x < 0)
    button.center = CGPointMake(0, button.center.y);
  if (button.center.y < 0)
    button.center = CGPointMake(button.center.x, 0);
  if (button.center.y > mainFrame.size.height)
    button.center = CGPointMake(button.center.x, mainFrame.size.height);
  if (button.center.x > mainFrame.size.width)
    button.center = CGPointMake(mainFrame.size.width, button.center.y);

  BBonebenphai2.center = button.center;
  BBonebenphai2.frame = button.frame;
}

- (void)showlogv1 {
  UIView *mainView =
      [UIApplication sharedApplication].windows[0].rootViewController.view;

  UIButton *InvisibleMenuButton =
      [UIButton buttonWithType:UIButtonTypeRoundedRect];
  InvisibleMenuButton.frame = CGRectMake(
      mainView.frame.size.width / 2, mainView.frame.size.height / 2, 55, 55);
  InvisibleMenuButton.backgroundColor = [UIColor clearColor];
  [InvisibleMenuButton addTarget:self
                          action:@selector(ButtonDragLogV1:withEvent:)
                forControlEvents:UIControlEventTouchDragInside];
  UITapGestureRecognizer *tapGestureRecognizer =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(BBoneLogV1:)];
  [InvisibleMenuButton addGestureRecognizer:tapGestureRecognizer];
  [[UIApplication sharedApplication].windows[0].rootViewController.view
      addSubview:InvisibleMenuButton];
  BBoneLogV1 = [[UIButton alloc]
      initWithFrame:CGRectMake(mainView.frame.size.width / 2,
                               mainView.frame.size.height / 2, 55, 55)];
  BBoneLogV1.backgroundColor = [UIColor colorWithRed:0.00
                                               green:0.00
                                                blue:0.00
                                               alpha:0.50];
  [BBoneLogV1 setTitle:NSCRYPT("LOG") forState:UIControlStateNormal];
  [BBoneLogV1.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
  [BBoneLogV1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
  BBoneLogV1.layer.cornerRadius = BBoneLogV1.frame.size.width / 2.0;
  BBoneLogV1.clipsToBounds = YES;
  [hideRecordView addSubview:BBoneLogV1];
}

- (void)BBoneLogV1:(UITapGestureRecognizer *)tapGestureRecognizer {
  if (tapGestureRecognizer.state == UIGestureRecognizerStateEnded) {
    BBoneLogV1.selected = !BBoneLogV1.selected;
    if (BBoneLogV1.selected) {
      [BBoneLogV1 setTitleColor:[UIColor greenColor]
                       forState:UIControlStateNormal];
      [[maintool sharemain] createPushNotification];
    } else {
      [BBoneLogV1 setTitleColor:[UIColor redColor]
                       forState:UIControlStateNormal];
      [[maintool sharemain] createPushNotification];
    }
  }
}

- (void)ButtonDragLogV1:(UIButton *)button withEvent:(UIEvent *)event {
  UITouch *touch = [[event touchesForView:button] anyObject];

  CGPoint previousLocation = [touch previousLocationInView:button];
  CGPoint location = [touch locationInView:button];
  CGFloat delta_x = location.x - previousLocation.x;
  CGFloat delta_y = location.y - previousLocation.y;

  button.center =
      CGPointMake(button.center.x + delta_x, button.center.y + delta_y);

  CGRect mainFrame = [UIApplication sharedApplication]
                         .windows[0]
                         .rootViewController.view.bounds;
  if (button.center.x < 0)
    button.center = CGPointMake(0, button.center.y);
  if (button.center.y < 0)
    button.center = CGPointMake(button.center.x, 0);
  if (button.center.y > mainFrame.size.height)
    button.center = CGPointMake(button.center.x, mainFrame.size.height);
  if (button.center.x > mainFrame.size.width)
    button.center = CGPointMake(mainFrame.size.width, button.center.y);

  BBoneLogV1.center = button.center;
  BBoneLogV1.frame = button.frame;
}

- (void)showlogV2 {
  UIView *mainView =
      [UIApplication sharedApplication].windows[0].rootViewController.view;

  UIButton *InvisibleMenuButton =
      [UIButton buttonWithType:UIButtonTypeRoundedRect];
  InvisibleMenuButton.frame = CGRectMake(
      mainView.frame.size.width / 2, mainView.frame.size.height / 2, 55, 55);
  InvisibleMenuButton.backgroundColor = [UIColor clearColor];
  [InvisibleMenuButton addTarget:self
                          action:@selector(ButtonDragLogV2:withEvent:)
                forControlEvents:UIControlEventTouchDragInside];
  UITapGestureRecognizer *tapGestureRecognizer =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(BBoneLogV2:)];
  [InvisibleMenuButton addGestureRecognizer:tapGestureRecognizer];
  [[UIApplication sharedApplication].windows[0].rootViewController.view
      addSubview:InvisibleMenuButton];
  BBoneLogV2 = [[UIButton alloc]
      initWithFrame:CGRectMake(mainView.frame.size.width / 2,
                               mainView.frame.size.height / 2, 55, 55)];
  BBoneLogV2.backgroundColor = [UIColor colorWithRed:0.00
                                               green:0.00
                                                blue:0.00
                                               alpha:0.50];
  [BBoneLogV2 setTitle:NSCRYPT("LOG") forState:UIControlStateNormal];
  [BBoneLogV2.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
  [BBoneLogV2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
  BBoneLogV2.layer.cornerRadius = BBoneLogV2.frame.size.width / 2.0;
  BBoneLogV2.clipsToBounds = YES;
  [hideRecordView addSubview:BBoneLogV2];
}

- (void)BBoneLogV2:(UITapGestureRecognizer *)tapGestureRecognizer {
  if (tapGestureRecognizer.state == UIGestureRecognizerStateEnded) {
    BBoneLogV2.selected = !BBoneLogV2.selected;
    if (BBoneLogV2.selected) {
      [BBoneLogV2 setTitleColor:[UIColor greenColor]
                       forState:UIControlStateNormal];
      [[maintool sharemain] createPushNotification2];
    } else {
      [BBoneLogV2 setTitleColor:[UIColor redColor]
                       forState:UIControlStateNormal];
      [[maintool sharemain] createPushNotification2];
    }
  }
}

- (void)ButtonDragLogV2:(UIButton *)button withEvent:(UIEvent *)event {
  UITouch *touch = [[event touchesForView:button] anyObject];

  CGPoint previousLocation = [touch previousLocationInView:button];
  CGPoint location = [touch locationInView:button];
  CGFloat delta_x = location.x - previousLocation.x;
  CGFloat delta_y = location.y - previousLocation.y;

  button.center =
      CGPointMake(button.center.x + delta_x, button.center.y + delta_y);

  CGRect mainFrame = [UIApplication sharedApplication]
                         .windows[0]
                         .rootViewController.view.bounds;
  if (button.center.x < 0)
    button.center = CGPointMake(0, button.center.y);
  if (button.center.y < 0)
    button.center = CGPointMake(button.center.x, 0);
  if (button.center.y > mainFrame.size.height)
    button.center = CGPointMake(button.center.x, mainFrame.size.height);
  if (button.center.x > mainFrame.size.width)
    button.center = CGPointMake(mainFrame.size.width, button.center.y);

  BBoneLogV2.center = button.center;
  BBoneLogV2.frame = button.frame;
}
////Map
void (*_LActorRoot_Visible)(void *instance, int camp, bool bVisible,
                            const bool forceSync);
void LActorRoot_Visible(void *instance, int camp, bool bVisible,
                        const bool forceSync = false) {
  if (instance != nullptr && MapHack) {
    if (camp == 1 || camp == 2 || camp == 110 || camp == 255) {
      bVisible = true;
    }
  }
  return _LActorRoot_Visible(instance, camp, bVisible, forceSync);
}
////unti
bool ShowInfHero;
void (*_ShowSkillStateInfo)(void *instance, bool bShow);
void ShowSkillStateInfo(void *instance, bool bShow) {
  if (instance != NULL && MapHack) {
    bShow = true;
  }
  _ShowSkillStateInfo(instance, MapHack);
}
/// icon
bool ShowIcon;
void (*_ShowHeroInfo)(void *instance, bool bShow);
void ShowHeroInfo(void *instance, bool bShow) {
  if (instance != NULL && MapHack) {
    bShow = true;
  }
  _ShowHeroInfo(instance, bShow);
}

/////HP
bool ShowHP;
void (*_ShowHeroHpInfo)(void *instance, bool bShow);
void ShowHeroHpInfo(void *instance, bool bShow) {
  if (instance != NULL && MapHack) {
    bShow = true;
  }
  _ShowHeroHpInfo(instance, bShow);
}