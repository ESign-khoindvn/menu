#pragma once

#define ARGB(a, r, g, b) 0 | a << 24 | r << 16 | g << 8 | b
#define M_PI 3.14159265358979323846

#define RAD2DEG(x) ((float)(x) * (float)(180.f / IM_PI))
#define DEG2RAD(x) ((float)(x) * (float)(IM_PI / 180.f))

static inline ImVec2 operator*(const ImVec2 &lhs, const float rhs) {
  return ImVec2(lhs.x * rhs, lhs.y * rhs);
}
static inline ImVec2 operator/(const ImVec2 &lhs, const float rhs) {
  return ImVec2(lhs.x / rhs, lhs.y / rhs);
}
static inline ImVec2 operator+(const ImVec2 &lhs, const float rhs) {
  return ImVec2(lhs.x + rhs, lhs.y + rhs);
}
static inline ImVec2 operator+(const ImVec2 &lhs, const ImVec2 &rhs) {
  return ImVec2(lhs.x + rhs.x, lhs.y + rhs.y);
}
static inline ImVec2 operator-(const ImVec2 &lhs, const ImVec2 &rhs) {
  return ImVec2(lhs.x - rhs.x, lhs.y - rhs.y);
}
static inline ImVec2 operator-(const ImVec2 &lhs, const float rhs) {
  return ImVec2(lhs.x - rhs, lhs.y - rhs);
}
static inline ImVec2 operator*(const ImVec2 &lhs, const ImVec2 &rhs) {
  return ImVec2(lhs.x * rhs.x, lhs.y * rhs.y);
}
static inline ImVec2 operator/(const ImVec2 &lhs, const ImVec2 &rhs) {
  return ImVec2(lhs.x / rhs.x, lhs.y / rhs.y);
}
static inline ImVec2 &operator*=(ImVec2 &lhs, const float rhs) {
  lhs.x *= rhs;
  lhs.y *= rhs;
  return lhs;
}
static inline ImVec2 &operator/=(ImVec2 &lhs, const float rhs) {
  lhs.x /= rhs;
  lhs.y /= rhs;
  return lhs;
}
static inline ImVec2 &operator+=(ImVec2 &lhs, const ImVec2 &rhs) {
  lhs.x += rhs.x;
  lhs.y += rhs.y;
  return lhs;
}
static inline ImVec2 &operator-=(ImVec2 &lhs, const ImVec2 &rhs) {
  lhs.x -= rhs.x;
  lhs.y -= rhs.y;
  return lhs;
}
static inline ImVec2 &operator*=(ImVec2 &lhs, const ImVec2 &rhs) {
  lhs.x *= rhs.x;
  lhs.y *= rhs.y;
  return lhs;
}
static inline ImVec2 &operator/=(ImVec2 &lhs, const ImVec2 &rhs) {
  lhs.x /= rhs.x;
  lhs.y /= rhs.y;
  return lhs;
}
static inline ImVec4 operator+(const ImVec4 &lhs, const ImVec4 &rhs) {
  return ImVec4(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w);
}
static inline ImVec4 operator-(const ImVec4 &lhs, const ImVec4 &rhs) {
  return ImVec4(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w);
}
static inline ImVec4 operator*(const ImVec4 &lhs, const ImVec4 &rhs) {
  return ImVec4(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z, lhs.w * rhs.w);
}

template <typename T>
inline T clamp(const T &n, const T &lower, const T &upper) {
  return std::max(lower, std::min(n, upper));
}

inline float lerp(float a, float b, float f) {
  return std::clamp<float>(a + f * (b - a), a > b ? b : a, a > b ? a : b);
}

inline ImColor collerp(ImColor a, ImColor b, float f) {
  return {a.Value.x + f * (b.Value.x - a.Value.x),
          a.Value.y + f * (b.Value.y - a.Value.y),
          a.Value.z + f * (b.Value.z - a.Value.z),
          a.Value.w + f * (b.Value.w - a.Value.w)};
}
const float ESP_BOX_WIDTH = 100.0f; // Chiều rộng cố định
const float ESP_BOX_HEIGHT = 200.0f;

float LineColor[3] = {1.0f, 1.0f, 1.0f}; // Màu mặc định là đỏ
float PlayerColor[3] = {1.0f, 1.0f, 0.0f};

float VisibleColor[3] = {0.0f, 1.0f, 0.0f};
//
static bool isFirst = true;
void *Entity = NULL; // Global Entity declaration shared with vuthook.h

void DrawESP(ImDrawList *draw) {
  // Throttled diagnostic log (disabled)
  // static float diagTimer = 0.0f;
  // diagTimer += ImGui::GetIO().DeltaTime;
  // if (diagTimer > 1.0f) {
  //   diagTimer = 0.0f;
  //   int enemyCount = (espManager && espManager->enemies)
  //                        ? (int)espManager->enemies->size()
  //                        : -1;
  //   NSLogC(@"[DIAG] AimSkill=%d, KC=%.1f, DL=%.3f, Slot=%d, "
  //          @"Sk1=%d,Sk2=%d,Sk3=%d, enemies=%d, Entity=%p",
  //          AimSkill, KhoangCach, DoLechAim, SkillSlot, AimSkill1, AimSkill2,
  //          AimSkill3, enemyCount, Entity);
  // }

  auto WorldToScreen = [&](const Vector3 &wp) -> ImVec2 {
    void *cam = get_main();
    if (!cam)
      return ImVec2(0.f, 0.f);
    Vector3 sc = WorldToScreens(cam, wp, 2);
    if (sc.z > 0.0f)
      return ImVec2(sc.x * kWidth, kHeight - sc.y * kHeight);
    else
      return ImVec2(kWidth - sc.x * kWidth, sc.y * kHeight);
  };
  float headHeightOffset = 1.7f;

  int numberOfEnemies = 0;

  float minHealth = std::numeric_limits<float>::infinity();
  float minHealth2 = std::numeric_limits<float>::infinity();
  float minHealthPercent = std::numeric_limits<float>::max();
  float closestEnemyDistance = std::numeric_limits<float>::infinity();
  float closestEnemyDistanceView = std::numeric_limits<float>::infinity();

  if (espManager->enemies != NULL) {
    for (int i = 0; i < espManager->enemies->size(); i++) { // Safe Loop
      if (i >= espManager->enemies->size())
        break; // Extra safety check
      void *MyActor = espManager->MyPlayer;
      void *Enemy = (*espManager->enemies)[i]->object;
      void *EnemyLinker = (*ActorLinker_enemy->enemies)[i]->object;

      if (Enemy == NULL)
        isFirst = true;

      Vector3 EnemyPos = Vector3::zero();

      if (MyActor && Enemy) {
        Vector3 myPos = ActorLinker_getPosition(MyActor);

        void *cammyPos = get_main();
        Vector3 myPosSC = WorldToScreens(cammyPos, myPos, 2);

        ImVec2 myPos_Vec2 = ImVec2(myPosSC.x, myPosSC.y);

        if (myPosSC.z > 0) {
          myPos_Vec2 =
              ImVec2(myPosSC.x * kWidth, kHeight - myPosSC.y * kHeight);
        } else {
          myPos_Vec2 = ImVec2(kWidth - myPosSC.x * kWidth, myPosSC.y * kHeight);
        }

        VInt3 *locationPtr = (VInt3 *)((uint64_t)Enemy + LActorRoot_location);
        VInt3 *forwardPtr = (VInt3 *)((uint64_t)Enemy + LActorRoot_forward);

        EnemyPos = VInt2Vector(*locationPtr, *forwardPtr);

        if (previousEnemyPositions.find((uintptr_t)Enemy) ==
            previousEnemyPositions.end()) {
          previousEnemyPositions[(uintptr_t)Enemy] = EnemyPos;
        }
        EnemyPos =
            Lerp(previousEnemyPositions[(uintptr_t)Enemy], EnemyPos, 0.2f);
        previousEnemyPositions[(uintptr_t)Enemy] = EnemyPos;

        void *LObjWrapper =
            *(void **)((uint64_t)Enemy + LActorRoot_ActorControl);
        void *ValuePropertyComponent =
            *(void **)((uint64_t)Enemy + LActorRoot_ValueComponent);

        if (!LObjWrapper || !ValuePropertyComponent)
          continue;

        void *ActorConfig =
            *(void **)((uint64_t)EnemyLinker + ActorLinker_ObjLinker);
        if (ActorConfig == NULL)
          continue;

        int ActorID = *(int *)((uint64_t)ActorConfig + ActorConfig_ConfigID);

        void *camEnemyPos = get_main();
        Vector3 rootPos_W2S = WorldToScreens(camEnemyPos, EnemyPos, 2);
        Vector2 rootPos_Vec2 = Vector2(rootPos_W2S.x, rootPos_W2S.y);

        if (rootPos_W2S.z > 0) {
          rootPos_Vec2 = Vector2(rootPos_W2S.x * kWidth,
                                 kHeight - rootPos_W2S.y * kHeight);
        } else {
          rootPos_Vec2 =
              Vector2(kWidth - rootPos_W2S.x * kWidth, rootPos_W2S.y * kHeight);
        }

        Vector2 headPos_Vec2 = Vector2(
            rootPos_Vec2.x, rootPos_Vec2.y - (kHeight / 9)); // Đầu cao hơn
        Vector2 bottomPos_Vec2 = Vector2(
            rootPos_Vec2.x, rootPos_Vec2.y + (kHeight / 25)); // Chân thấp hơn
        GetDistanceEnemy = Vector3::Distance(myPos, EnemyPos);
        ImVec2 myPos_ImVec2 = ImVec2(myPos_Vec2.x, myPos_Vec2.y);
        ImVec2 rootPos_ImVec2 = ImVec2(rootPos_Vec2.x, rootPos_Vec2.y);

        if (!LObjWrapper_get_IsDeadState(LObjWrapper)) {
          int Health =
              ValuePropertyComponent_get_actorHp(ValuePropertyComponent);
          int MaxHealth =
              ValuePropertyComponent_get_actorHpTotal(ValuePropertyComponent);
          int HealthPercent = (int)std::round((float)Health / MaxHealth * 100);
          float HpEnemys = ((float)Health / (float)MaxHealth) * 100.0f;

          ImGuiViewport *vp = ImGui::GetMainViewport();
          float screenW = vp->WorkSize.x;
          float screenFraction = 0.046f;
          float fixedBoxWidth = screenW * screenFraction;

          float boxWidth = fixedBoxWidth / (rootPos_W2S.z / fixedBoxWidth);
          float boxHeight = boxWidth * 1.25f;

          float boxCenterOffsetY = -7.0f;

          ImVec2 vStart = {rootPos_Vec2.x - boxWidth / 2,
                           rootPos_Vec2.y - boxHeight / (float)1.35};
          ImVec2 vEnd = {vStart.x + boxWidth, vStart.y + boxHeight};
          ImVec2 CenterBox = {(vStart.x + vEnd.x) / 2,
                              (vStart.y + vEnd.y - 1) / 2};

          // Aim bot
          if (AimSkill) {
            float speedEnemy =
                (float)get_speed(LActorRoot_get_PlayerMovement(Enemy)) /
                1000.0f;
            float hpPercent = (float)Health / (float)MaxHealth;
            bool validSlot = (SkillSlot == 1 && AimSkill1) ||
                             (SkillSlot == 2 && AimSkill2) ||
                             (SkillSlot == 3 && AimSkill3);

            if (Entity == NULL) {
              EnemyTarget.myPos = Vector3::zero();
              EnemyTarget.enemyPos = Vector3::zero();
              EnemyTarget.moveForward = Vector3::zero();
              EnemyTarget.currentSpeed = 0.0f;
              EnemyTarget.DoLech = 0.0f;
              EnemyTarget.Ranger = 0.0f;
              minHealth = std::numeric_limits<float>::infinity();
              minHealth2 = std::numeric_limits<float>::infinity();
              minHealthPercent = std::numeric_limits<float>::max();
              closestEnemyDistance = std::numeric_limits<float>::infinity();
              closestEnemyDistanceView = std::numeric_limits<float>::infinity();
            }

            if (validSlot && GetDistanceEnemy <= KhoangCach) {
              bool isBestTarget = false;

              if (aimType == 0 && Health < minHealth) {
                minHealth = Health;
                isBestTarget = true;
              } else if (aimType == 1) {
                if (hpPercent < minHealthPercent) {
                  minHealthPercent = hpPercent;
                  minHealth2 = Health;
                  isBestTarget = true;
                } else if (hpPercent == minHealthPercent &&
                           Health < minHealth2) {
                  minHealth2 = Health;
                  isBestTarget = true;
                }
              } else if (aimType == 2 &&
                         GetDistanceEnemy < closestEnemyDistance) {
                closestEnemyDistance = GetDistanceEnemy;
                isBestTarget = true;
              } else if (aimType == 3) {
                // Requires ClosestDistanceEnemy and CurrentPosition from
                // vuthook.h scope or global
                float angleDist =
                    ClosestDistanceEnemy(myPos, EnemyPos, CurrentPosition);
                if (angleDist < closestEnemyDistanceView) {
                  closestEnemyDistanceView = angleDist;
                  isBestTarget = true;
                }
              }

              if (isBestTarget) {
                Entity = Enemy;
                EnemyTarget.myPos = myPos;
                EnemyTarget.enemyPos = EnemyPos;
                EnemyTarget.moveForward = VIntVector(*forwardPtr);
                EnemyTarget.currentSpeed = speedEnemy;
                EnemyTarget.DoLech = DoLechAim;
                EnemyTarget.Ranger = KhoangCach;
              }
            }
          }
        }
      }
    }
  } // End of enemies loop

  if (Entity != NULL && AimSkill && DrawAimLine) {
    Vector3 myHeadPos =
        EnemyTarget.myPos + Vector3(0.0f, headHeightOffset - 1.0f, 0.0f);
    Vector3 enemyHeadPos =
        EnemyTarget.enemyPos + Vector3(0.0f, headHeightOffset - 1.0f, 0.0f);

    ImVec2 myScreenPos = WorldToScreen(myHeadPos);
    ImVec2 enemyScreenPos = WorldToScreen(enemyHeadPos);

    draw->AddLine(myScreenPos, enemyScreenPos, IM_COL32(116, 255, 23, 255),
                  1.2f); // rgb(116, 255, 23)
    draw->AddCircleFilled(enemyScreenPos, 4.0f, IM_COL32(116, 255, 23, 200));
    draw->AddCircle(enemyScreenPos, 6.0f, IM_COL32(116, 255, 23, 100), 64,
                    2.0f);
  }
}

float Rainbow() {
  static float x = 0, y = 0;
  static float r = 0, g = 0, b = 0;
  if (y >= 0.0f && y < 255.0f) {
    r = 255.0f;
    g = 0.0f;
    b = x;
  } else if (y >= 255.0f && y < 510.0f) {
    r = 255.0f - x;
    g = 0.0f;
    b = 255.0f;
  } else if (y >= 510.0f && y < 765.0f) {
    r = 0.0f;
    g = x;
    b = 255.0f;
  } else if (y >= 765.0f && y < 1020.0f) {
    r = 0.0f;
    g = 255.0f;
    b = 255.0f - x;
  } else if (y >= 1020.0f && y < 1275.0f) {
    r = x;
    g = 255.0f;
    b = 0.0f;
  } else if (y >= 1275.0f && y < 1530.0f) {
    r = 255.0f;
    g = 255.0f - x;
    b = 0.0f;
  }
  x += 0.25f;
  if (x >= 255.0f)
    x = 0.0f;
  y += 0.25f;
  if (y > 1530.0f)
    y = 0.0f;
  return ARGB(255, (int)r, (int)g, (int)b);
}

class ESP {
public:
  void drawText(const char *text, float X, float Y, float size, long color) {
    ImGui::GetBackgroundDrawList()->AddText(NULL, size, ImVec2(X, Y), color,
                                            text);
  }

  void drawLine(float startX, float startY, float stopX, float stopY,
                float thicc, long color) {
    ImGui::GetBackgroundDrawList()->AddLine(ImVec2(startX, startY),
                                            ImVec2(stopX, stopY), color, thicc);
  }

  void drawBorder(float X, float Y, float width, float height, float thicc,
                  long color) {
    ImGui::GetBackgroundDrawList()->AddRect(
        ImVec2(X, Y), ImVec2(X + width, Y + height), color, thicc);
  }

  void drawBox(float X, float Y, float width, float height, float thicc,
               long color) {
    ImGui::GetBackgroundDrawList()->AddRectFilled(
        ImVec2(X, Y), ImVec2(X + width, Y + height), color, thicc);
  }

  void drawCornerBox(int x, int y, int w, int h, float thickness, long color) {
    int iw = w / 4;
    int ih = h / 4;

    ImGui::GetBackgroundDrawList()->AddLine(ImVec2(x, y), ImVec2(x + iw, y),
                                            color, thickness);
    ImGui::GetBackgroundDrawList()->AddLine(ImVec2(x, y), ImVec2(x, y + ih),
                                            color, thickness);
    ImGui::GetBackgroundDrawList()->AddLine(
        ImVec2(x + w - 1, y), ImVec2(x + w - 1, y + ih), color, thickness);
    ImGui::GetBackgroundDrawList()->AddLine(
        ImVec2(x, y + h), ImVec2(x + iw, y + h), color, thickness);
    ImGui::GetBackgroundDrawList()->AddLine(
        ImVec2(x + w - iw, y + h), ImVec2(x + w, y + h), color, thickness);
    ImGui::GetBackgroundDrawList()->AddLine(ImVec2(x, y + h - ih),
                                            ImVec2(x, y + h), color, thickness);
    ImGui::GetBackgroundDrawList()->AddLine(ImVec2(x + w - 1, y + h - ih),
                                            ImVec2(x + w - 1, y + h), color,
                                            thickness);
  }
};

void drawFixedESPBox(ImDrawList *draw, ImVec2 centerPos) {
  ImVec2 min =
      ImVec2(centerPos.x - ESP_BOX_WIDTH / 2, centerPos.y - ESP_BOX_HEIGHT / 2);
  ImVec2 max =
      ImVec2(centerPos.x + ESP_BOX_WIDTH / 2, centerPos.y + ESP_BOX_HEIGHT / 2);
  draw->AddRect(min, max, IM_COL32(255, 255, 255, 255), 0.0f, 0,
                1.0f); // Vẽ hộp với màu trắng và độ dày 1.0f
}

bool isOutsideScreen(ImVec2 pos, ImVec2 screen) {
  if (pos.y < 0) {
    return true;
  }
  if (pos.x > screen.x) {
    return true;
  }
  if (pos.y > screen.y) {
    return true;
  }
  return pos.x < 0;
}

void DrawCd(ImDrawList *draw, ImVec2 position, float size, ImU32 color,
            int cd) {
  ImVec2 points[4] = {ImVec2(position.x - size, position.y),
                      ImVec2(position.x, position.y - size),
                      ImVec2(position.x + size, position.y),
                      ImVec2(position.x, position.y + size)};
  if (cd == 0) {
    draw->AddConvexPolyFilled(points, 4, color);

  } else {
    // draw->AddConvexPolyFilled(points, 4, IM_COL32(255, 255, 255, 255));
    auto textSize = ImGui::CalcTextSize(std::to_string(cd).c_str(), 0,
                                        ((float)kHeight / 30.0f));
    draw->AddText(
        ImGui::GetFont(), ((float)kHeight / 30.0f),
        {position.x - (textSize.x / 2), position.y - (textSize.y / 2)},
        ImColor(0, 255, 0, 255), std::to_string(cd).c_str());
  }
}

ImVec2 pushToScreenBorder(ImVec2 Pos, ImVec2 screen, int offset) {
  int x = (int)Pos.x;
  int y = (int)Pos.y;

  if (Pos.y < 0) {
    y = -offset;
  }

  if (Pos.x > screen.x) {
    x = (int)screen.x + offset;
  }

  if (Pos.y > screen.y) {
    y = (int)screen.y + offset;
  }

  if (Pos.x < 0) {
    x = -offset;
  }
  return ImVec2(x, y);
}

void DrawCircleHealth(ImVec2 position, int health, int max_health,
                      float radius) {
  float a_max = ((3.14159265359f * 2.0f));
  ImU32 healthColor = IM_COL32(124, 252, 0, 200);
  if (health <= (max_health * 0.6)) {
    healthColor = IM_COL32(180, 180, 45, 255);
  }
  if (health < (max_health * 0.3)) {
    healthColor = IM_COL32(180, 45, 45, 255);
  }
  ImGui::GetForegroundDrawList()->PathArcTo(
      position, radius,
      (-(a_max / 4.0f)) + (a_max / max_health) * (max_health - health),
      a_max - (a_max / 4.0f));
  ImGui::GetForegroundDrawList()->PathStroke(healthColor, ImDrawFlags_None, 4);
}
void DrawCircleHealth2(ImVec2 position, int health, int max_health,
                       float radius) {
  float a_max = ((3.14159265359f * 2.0f));
  ImU32 healthColor = IM_COL32(45, 180, 45, 255);
  if (health <= (max_health * 0.6)) {
    healthColor = IM_COL32(180, 180, 45, 255);
  }
  if (health < (max_health * 0.3)) {
    healthColor = IM_COL32(180, 45, 45, 255);
  }
  ImGui::GetForegroundDrawList()->PathArcTo(
      position, radius,
      (-(a_max / 4.0f)) + (a_max / max_health) * (max_health - health),
      a_max - (a_max / 4.0f));
  ImGui::GetForegroundDrawList()->PathStroke(healthColor, ImDrawFlags_None,
                                             1.7);
}

Color colorByDistance(int distance, float alpha) {
  Color _colorByDistance;
  if (distance < 450)
    _colorByDistance = Color(255, 0, 0, alpha);
  if (distance < 200)
    _colorByDistance = Color(255, 0, 0, alpha);
  if (distance < 121)
    _colorByDistance = Color(0, 10, 51, alpha);
  if (distance < 51)
    _colorByDistance = Color(0, 67, 0, alpha);
  return _colorByDistance;
}
Vector2 pushToScreenBorder(Vector2 Pos, Vector2 screen, int offset) {
  int X = (int)Pos.x;
  int Y = (int)Pos.y;
  if (Pos.y < 50) {
    // top
    Y = 42 - offset;
  }
  if (Pos.x > screen.x) {
    // right
    X = (int)screen.x + offset;
  }
  if (Pos.y > screen.y) {
    // bottom
    Y = (int)screen.y + offset;
  }
  if (Pos.x < 60) {
    // left
    X = 20 - offset;
  }
  return Vector2(X, Y);
}
bool isOutsideSafeZone(Vector2 pos, Vector2 screen) {
  if (pos.y < 60) {
    return true;
  }
  if (pos.x > screen.x) {
    return true;
  }
  if (pos.y > screen.y) {
    return true;
  }
  return pos.x < 50;
}

// void Draw3dBox(ImDrawList* draw, Vector3 Transform, Camera* camera, int
// glHeight, int glWidth, void* LObjWrapper, void* EnemyLinker) {
//   ImColor lineColor;

//   if (LObjWrapper_IsAutoAI(LObjWrapper)) {
//     lineColor = ImColor(LineColor[0], LineColor[1], LineColor[2]);

//     // ImColor lineColor = ImColor(color[0], color[1], color[2]);

//   } else {
//     lineColor = ImColor(PlayerColor[0], PlayerColor[1], PlayerColor[2]);
//   }
//   if (!ActorLinker_get_bVisible(EnemyLinker)) {
//     lineColor = ImColor(VisibleColor[0], VisibleColor[1], VisibleColor[2]);
//   }
//   Vector3 position2 = Transform + Vector3(0.6, 1.6, 0.6);
//   Vector3 position3 = Transform + Vector3(0.6, 0, 0.6);
//   Vector3 position4 = Transform + Vector3(-0.5, 0, 0.6);
//   Vector3 position5 = Transform + Vector3(-0.5, 1.6, 0.6);
//   Vector3 position6 = (Transform + Vector3(0.6, 1.6, 0)) + Vector3(0, 0,
//   -0.6); Vector3 position7 = (Transform + Vector3(0.6, 0, 0)) + Vector3(0, 0,
//   -0.6); Vector3 position8 = (Transform + Vector3(-0.5, 0, 0)) + Vector3(0,
//   0, -0.6); Vector3 position9 = (Transform + Vector3(-0.5, 1.6, 0)) +
//   Vector3(0, 0, -0.6);

//   Vector3 vector = camera->WorldToScreenPoint(position2);
//   Vector3 vector2 = camera->WorldToScreenPoint(position3);
//   Vector3 vector3 = camera->WorldToScreenPoint(position4);
//   Vector3 vector4 = camera->WorldToScreenPoint(position5);
//   Vector3 vector5 = camera->WorldToScreenPoint(position6);
//   Vector3 vector6 = camera->WorldToScreenPoint(position7);
//   Vector3 vector7 = camera->WorldToScreenPoint(position8);
//   Vector3 vector8 = camera->WorldToScreenPoint(position9);

//   if (vector.z > 0 && vector2.z > 0 && vector3.z > 0 && vector4.z > 0 &&
//   vector5.z > 0 && vector6.z > 0 && vector7.z > 0 && vector8.z > 0) {
//     draw->AddLine({(float)(glWidth - (glWidth - vector.x)), (glHeight -
//     vector.y)}, {glWidth - (glWidth - vector2.x), glHeight - vector2.y},
//     lineColor, 2.0f); draw->AddLine({(float)(glWidth - (glWidth -
//     vector3.x)), (glHeight - vector3.y)}, {glWidth - (glWidth - vector2.x),
//     glHeight - vector2.y}, lineColor, 2.0f); draw->AddLine({(float)(glWidth -
//     (glWidth - vector.x)), (glHeight - vector.y)}, {glWidth - (glWidth -
//     vector4.x), glHeight - vector4.y}, lineColor, 2.0f);
//     draw->AddLine({(float)(glWidth - (glWidth - vector4.x)), (glHeight -
//     vector4.y)}, {glWidth - (glWidth - vector3.x), glHeight - vector3.y},
//     lineColor, 2.0f);

//     draw->AddLine({(float)(glWidth - (glWidth - vector5.x)), (glHeight -
//     vector5.y)}, {glWidth - (glWidth - vector6.x), glHeight - vector6.y},
//     lineColor, 2.0f); draw->AddLine({(float)(glWidth - (glWidth -
//     vector7.x)), (glHeight - vector7.y)}, {glWidth - (glWidth - vector6.x),
//     glHeight - vector6.y}, lineColor, 2.0f); draw->AddLine({(float)(glWidth -
//     (glWidth - vector5.x)), (glHeight - vector5.y)}, {glWidth - (glWidth -
//     vector8.x), glHeight - vector8.y}, lineColor, 2.0f);
//     draw->AddLine({(float)(glWidth - (glWidth - vector8.x)), (glHeight -
//     vector8.y)}, {glWidth - (glWidth - vector7.x), glHeight - vector7.y},
//     lineColor, 2.0f);

//     draw->AddLine({(float)(glWidth - (glWidth - vector.x)), (glHeight -
//     vector.y)}, {glWidth - (glWidth - vector5.x), glHeight - vector5.y},
//     lineColor, 2.0f); draw->AddLine({(float)(glWidth - (glWidth -
//     vector2.x)), (glHeight - vector2.y)}, {glWidth - (glWidth - vector6.x),
//     glHeight - vector6.y}, lineColor, 2.0f); draw->AddLine({(float)(glWidth -
//     (glWidth - vector3.x)), (glHeight - vector3.y)}, {glWidth - (glWidth -
//     vector7.x), glHeight - vector7.y}, lineColor, 2.0f);
//     draw->AddLine({(float)(glWidth - (glWidth - vector4.x)), (glHeight -
//     vector4.y)}, {glWidth - (glWidth - vector8.x), glHeight - vector8.y},
//     lineColor, 2.0f);
//   }
// }

NSMutableDictionary *heroTextures;
- (void)initImageTexture:(id<MTLDevice>)device {
  heroTextures = [[NSMutableDictionary alloc] init];

  [self addHeroTexture:device heroName:@"airi" base64Data:airi_data];
  [self addHeroTexture:device heroName:@"aleister" base64Data:aleister_data];
  [self addHeroTexture:device heroName:@"alice" base64Data:alice_data];
  [self addHeroTexture:device heroName:@"allain" base64Data:allain_data];
  [self addHeroTexture:device heroName:@"amily" base64Data:amily_data];
  [self addHeroTexture:device heroName:@"annette" base64Data:annette_data];
  [self addHeroTexture:device heroName:@"aoi" base64Data:aoi_data];
  [self addHeroTexture:device heroName:@"arduin" base64Data:arduin_data];
  [self addHeroTexture:device heroName:@"athur" base64Data:arthur_data];
  [self addHeroTexture:device heroName:@"arum" base64Data:arum_data];
  [self addHeroTexture:device heroName:@"astrid" base64Data:astrid_data];
  [self addHeroTexture:device heroName:@"ata" base64Data:ata_data];
  [self addHeroTexture:device heroName:@"aya" base64Data:aya_data];
  [self addHeroTexture:device heroName:@"azzenka" base64Data:azzenka_data];
  [self addHeroTexture:device heroName:@"baldum" base64Data:baldum_data];
  [self addHeroTexture:device heroName:@"bijan" base64Data:bijan_data];
  [self addHeroTexture:device heroName:@"bonnie" base64Data:bonnie_data];
  [self addHeroTexture:device heroName:@"bright" base64Data:bright_data];
  [self addHeroTexture:device heroName:@"butterfly" base64Data:butterfly_data];
  [self addHeroTexture:device heroName:@"capheny" base64Data:capheny_data];
  [self addHeroTexture:device heroName:@"celica" base64Data:celica_data];
  [self addHeroTexture:device
              heroName:@"charlotter"
            base64Data:charlotter_data];
  [self addHeroTexture:device heroName:@"chaugnar" base64Data:chaugnar_data];
  [self addHeroTexture:device heroName:@"cresht" base64Data:cresht_data];
  [self addHeroTexture:device heroName:@"darcy" base64Data:darcy_data];
  [self addHeroTexture:device heroName:@"dextra" base64Data:dextra_data];
  [self addHeroTexture:device
              heroName:@"dieuthuyen"
            base64Data:dieuthuyen_data];
  [self addHeroTexture:device heroName:@"dirak" base64Data:dirak_data];
  [self addHeroTexture:device heroName:@"dolia" base64Data:dolia_data];
  [self addHeroTexture:device heroName:@"elandorr" base64Data:elandorr_data];
  [self addHeroTexture:device heroName:@"elsu" base64Data:elsu_data];
  [self addHeroTexture:device heroName:@"enzo" base64Data:enzo_data];
  [self addHeroTexture:device heroName:@"erin" base64Data:erin_data];
  [self addHeroTexture:device heroName:@"errol" base64Data:errol_data];
  [self addHeroTexture:device heroName:@"fennik" base64Data:fennik_data];
  [self addHeroTexture:device
              heroName:@"florentino"
            base64Data:florentino_data];
  [self addHeroTexture:device heroName:@"gildur" base64Data:gildur_data];
  [self addHeroTexture:device heroName:@"grakk" base64Data:grakk_data];
  [self addHeroTexture:device heroName:@"hayate" base64Data:hayate_data];
  [self addHeroTexture:device heroName:@"helen" base64Data:helen_data];
  [self addHeroTexture:device heroName:@"iggy" base64Data:iggy_data];
  [self addHeroTexture:device heroName:@"ignis" base64Data:ignis_data];
  [self addHeroTexture:device heroName:@"ilumia" base64Data:ilumia_data];
  [self addHeroTexture:device heroName:@"ishar" base64Data:ishar_data];
  [self addHeroTexture:device heroName:@"jinna" base64Data:jinna_data];
  [self addHeroTexture:device heroName:@"kahlii" base64Data:kahlii_data];
  [self addHeroTexture:device heroName:@"kaine" base64Data:kaine_data];
  [self addHeroTexture:device heroName:@"keera" base64Data:kerra_data];
  [self addHeroTexture:device heroName:@"kilgroth" base64Data:kilgroth_data];
  [self addHeroTexture:device heroName:@"kriknak" base64Data:kriknak_data];
  [self addHeroTexture:device heroName:@"krixi" base64Data:krixi_data];
  [self addHeroTexture:device heroName:@"krizzix" base64Data:krizzix_data];
  [self addHeroTexture:device heroName:@"lauriel" base64Data:lauriel_data];
  [self addHeroTexture:device heroName:@"laville" base64Data:laville_data];
  [self addHeroTexture:device heroName:@"liliana" base64Data:liliana_data];
  [self addHeroTexture:device heroName:@"lindis" base64Data:lindis_data];
  [self addHeroTexture:device heroName:@"lorion" base64Data:lorion_data];
  [self addHeroTexture:device heroName:@"lubo" base64Data:lubo_data];
  [self addHeroTexture:device heroName:@"lumburr" base64Data:lumburr_data];
  [self addHeroTexture:device heroName:@"maloch" base64Data:maloch_data];
  [self addHeroTexture:device heroName:@"marja" base64Data:marja_data];
  [self addHeroTexture:device heroName:@"max" base64Data:max_data];
  [self addHeroTexture:device heroName:@"mganga" base64Data:mganga_data];
  [self addHeroTexture:device heroName:@"mina" base64Data:mina_data];
  [self addHeroTexture:device heroName:@"ming" base64Data:ming_data];
  [self addHeroTexture:device heroName:@"moren" base64Data:moren_data];
  [self addHeroTexture:device heroName:@"murad" base64Data:murad_data];
  [self addHeroTexture:device heroName:@"nakroth" base64Data:nakroth_data];
  [self addHeroTexture:device heroName:@"natalya" base64Data:natalya_data];
  [self addHeroTexture:device heroName:@"ngokhong" base64Data:ngokhong_data];
  [self addHeroTexture:device heroName:@"ormarr" base64Data:omar_data];
  [self addHeroTexture:device heroName:@"omega" base64Data:omega_data];
  [self addHeroTexture:device heroName:@"omen" base64Data:omen_data];
  [self addHeroTexture:device heroName:@"paine" base64Data:pain_data];
  [self addHeroTexture:device heroName:@"preyta" base64Data:preyta_data];
  [self addHeroTexture:device heroName:@"qi" base64Data:qi_data];
  [self addHeroTexture:device heroName:@"quillen" base64Data:quilen_data];
  [self addHeroTexture:device heroName:@"raz" base64Data:raz_data];
  [self addHeroTexture:device heroName:@"richter" base64Data:richter_data];
  [self addHeroTexture:device heroName:@"rouie" base64Data:rouie_data];
  [self addHeroTexture:device heroName:@"rourke" base64Data:rouke_data];
  [self addHeroTexture:device heroName:@"roxie" base64Data:roxie_data];
  [self addHeroTexture:device heroName:@"ryoma" base64Data:ryoma_data];
  [self addHeroTexture:device heroName:@"sephera" base64Data:sephera_data];
  [self addHeroTexture:device heroName:@"sinestrea" base64Data:sinestrea_data];
  [self addHeroTexture:device heroName:@"skud" base64Data:skud_data];
  [self addHeroTexture:device heroName:@"slimz" base64Data:slimz_data];
  [self addHeroTexture:device heroName:@"stuart" base64Data:Stuart_data];
  [self addHeroTexture:device heroName:@"supperman" base64Data:superman_data];
  [self addHeroTexture:device heroName:@"tachi" base64Data:tachi_data];
  [self addHeroTexture:device heroName:@"tarra" base64Data:tara_data];
  [self addHeroTexture:device heroName:@"teemee" base64Data:teemee_data];
  [self addHeroTexture:device heroName:@"telannas" base64Data:telannas_data];
  [self addHeroTexture:device heroName:@"terri" base64Data:terri_data];
  [self addHeroTexture:device heroName:@"thane" base64Data:thane_data];
  [self addHeroTexture:device heroName:@"theflash" base64Data:theflash_data];
  [self addHeroTexture:device heroName:@"thorne" base64Data:thorne_data];
  [self addHeroTexture:device heroName:@"toro" base64Data:toro_data];
  [self addHeroTexture:device heroName:@"trieuvan" base64Data:trieuvan_data];
  [self addHeroTexture:device heroName:@"tulen" base64Data:tulen_data];
  [self addHeroTexture:device heroName:@"valhein" base64Data:valhein_data];
  [self addHeroTexture:device heroName:@"veres" base64Data:veres_data];
  [self addHeroTexture:device heroName:@"veera" base64Data:verra_data];
  [self addHeroTexture:device heroName:@"violet" base64Data:violet_data];
  [self addHeroTexture:device heroName:@"volkath" base64Data:volkat_data];
  [self addHeroTexture:device heroName:@"wisp" base64Data:wips_data];
  [self addHeroTexture:device heroName:@"wiro" base64Data:wiro_data];
  [self addHeroTexture:device
              heroName:@"wonderwoman"
            base64Data:wonderwoman_data];
  [self addHeroTexture:device heroName:@"xenniel" base64Data:xeniel_data];
  [self addHeroTexture:device heroName:@"yan" base64Data:yan_data];
  [self addHeroTexture:device heroName:@"ybneth" base64Data:ybneth_data];
  [self addHeroTexture:device heroName:@"yenna" base64Data:yena_data];
  [self addHeroTexture:device heroName:@"yorn" base64Data:yorn_data];
  [self addHeroTexture:device heroName:@"yue" base64Data:yue_data];
  [self addHeroTexture:device heroName:@"zata" base64Data:zata_data];
  [self addHeroTexture:device heroName:@"zephys" base64Data:zephys_data];
  [self addHeroTexture:device heroName:@"zill" base64Data:zill_data];
  [self addHeroTexture:device heroName:@"zip" base64Data:zip_data];
  [self addHeroTexture:device heroName:@"zuka" base64Data:zuka_data];
  [self addHeroTexture:device heroName:@"biron" base64Data:biron_data];
  [self addHeroTexture:device heroName:@"boltbaron" base64Data:boltbaron_data];
  [self addHeroTexture:device heroName:@"billow" base64Data:billow_data];
}

- (void)addHeroTexture:(id<MTLDevice>)device
              heroName:(NSString *)heroName
            base64Data:(NSString *)base64Data {
  NSData *data = [[NSData alloc]
      initWithBase64EncodedString:base64Data
                          options:NSDataBase64DecodingIgnoreUnknownCharacters];
  id<MTLTexture> texture = [self loadImageTexture:device data:data];
  if (texture) {
    [heroTextures setObject:texture forKey:heroName];
  }
}

- (id<MTLTexture>)loadImageTexture:(id<MTLDevice>)device
                              data:(NSData *)imageData {
  int width, height;
  unsigned char *pixels =
      stbi_load_from_memory((stbi_uc const *)[imageData bytes],
                            (int)[imageData length], &width, &height, NULL, 4);

  MTLTextureDescriptor *textureDescriptor = [MTLTextureDescriptor
      texture2DDescriptorWithPixelFormat:MTLPixelFormatRGBA8Unorm
                                   width:(NSUInteger)width
                                  height:(NSUInteger)height
                               mipmapped:NO];
  textureDescriptor.usage = MTLTextureUsageShaderRead;
  textureDescriptor.storageMode = MTLStorageModeShared;
  id<MTLTexture> texture = [device newTextureWithDescriptor:textureDescriptor];
  [texture
      replaceRegion:MTLRegionMake2D(0, 0, (NSUInteger)width, (NSUInteger)height)
        mipmapLevel:0
          withBytes:pixels
        bytesPerRow:(NSUInteger)width * 4];

  return texture;
}

void base642name(std::string nameP, std::string &heroname, int heroID) {
  if (nameP == "") {
    heroname = "Ata";
    namereal = "Ata";
    return;
  }
  if (nameP == "MTU3X0J1WmhpSHVvV3U=") {
    heroname = "Raz";
    namereal = "Raz";
    return;
  }
  if (nameP == "NTAzX1p1a2E=") {
    heroname = "Zuka";
    namereal = "Zuka";
    return;
  }
  if (nameP == "5p2O55m9") {
    heroname = "Murad";
    namereal = "Murad";
    return;
  }
  if (nameP == "6I2G6L2y") {
    heroname = "Butterfly";
    namereal = "Butterfly";
    return;
  }
  if (nameP == "5pu55pON") {
    heroname = "Lữ Bố";
    namereal = "lubo";
    return;
  }
  if (nameP == "MTEyX0dvbmdTaHVCYW4=") {
    heroname = "Yorn";
    namereal = "Yorn";
    return;
  }
  if (nameP == "NTIxX0Zsb3JlbnRpbm8=") {
    heroname = "Florentino";
    namereal = "Florentino";
    return;
  }
  if (nameP == "5qKF5p6X") {
    heroname = "Natalya";
    namereal = "Natalya";
    return;
  }
  if (nameP == "5Lqa55Gf546L" && heroID == 808) {
    heroname = "Rối Athur";
    namereal = "Athur";
    return;
  }
  if (nameP == "5Lqa55Gf546L") {
    heroname = "Athur";
    namereal = "Athur";
    return;
  }
  if (nameP == "54uE5LuB5p2w") {
    heroname = "Valhein";
    namereal = "Valhein";
    return;
  }
  if (nameP == "6Z+p5L+h") {
    heroname = "Nakroth";
    namereal = "Nakroth";
    return;
  }
  if (nameP == "IOWFuOmfpg==") {
    heroname = "Triệu vân";
    namereal = "trieuvan";
    return;
  }
  if (nameP == "5aKo57+f") {
    heroname = "Gildur";
    namereal = "Gildur";
    return;
  }
  if (nameP == "6I6J6I6J5a6J") {
    heroname = "Liliana";
    namereal = "Liliana";
    return;
  }
  if (nameP == "6K+46JGb5Lqu") {
    heroname = "Tulen";
    namereal = "Tulen";
    return;
  }
  if (nameP == "5a2U5aSr5a2Q" && heroID == 139) {
    heroname = "KilGroth";
    namereal = "KilGroth";
    return;
  }
  if (nameP == "MTY3X1d1S29uZw==") {
    heroname = "Ngộ Không";
    namereal = "Ngộ Không";
    return;
  }
  if (nameP == "6ZKf6aaX") {
    heroname = "Grakk";
    namereal = "Grakk";
    return;
  }
  if (nameP == "5ZSQ5LiJ6JeP") {
    heroname = "Skud";
    namereal = "Skud";
    return;
  }
  if (nameP == "5Z+D572X") {
    heroname = "Errol";
    namereal = "Errol";
    return;
  }
  if (nameP == "NTI0X0NhcGhlbnk=") {
    heroname = "Capheny";
    namereal = "Capheny";
    return;
  }
  if (nameP == "5Yi5") {
    heroname = "Zata";
    namereal = "Zata";
    return;
  }
  if (nameP == "5a2U5aSr5a2Q") {
    heroname = "Omen";
    namereal = "Omen";
    return;
  }
  if (nameP == "5a2Z5bCa6aaZ") {
    heroname = "Violet";
    namereal = "Violet";
    return;
  }
  if (nameP == "5omB6bmK") {
    heroname = "Mganga";
    namereal = "Mganga";
    return;
  }
  if (nameP == "VmVyZXM=") {
    heroname = "Veres";
    namereal = "Veres";
    return;
  }
  if (nameP == "54m55bCU5a6J5aic5pav" && heroID == 809) {
    heroname = "Rối TelAnnas";
    namereal = "TelAnnas";
    return;
  }
  if (nameP == "54m55bCU5a6J5aic5pav") {
    heroname = "TelAnnas";
    namereal = "TelAnnas";
    return;
  }
  if (nameP == "TmFrb3J1cnU=") {
    heroname = "Kriknak";
    namereal = "Kriknak";
    return;
  }
  if (nameP == "55m+6YeM5a6I57qm") {
    heroname = "Elsu";
    namereal = "Elsu";
    return;
  }
  if (nameP == "MTE3X1pob25nV3VZYW4=") {
    heroname = "Ormarr";
    namereal = "Ormarr";
    return;
  }
  if (nameP == "6Jme5aes") {
    heroname = "Stuart";
    namereal = "Stuart";
    return;
  }
  if (nameP == "6LW15LqR") {
    heroname = "Zephys";
    namereal = "Zephys";
    return;
  }
  if (nameP == "5Lqa6L+e") {
    heroname = "Allain";
    namereal = "Allain";
    return;
  }
  if (nameP == "5a6r5pys5q2m6JeP") {
    heroname = "Airi";
    namereal = "Airi";
    return;
  }
  if (nameP == "6ams5Y+v5rOi572X") {
    heroname = "Hayate";
    namereal = "Hayate";
    return;
  }
  if (nameP == "MTA5X0Rhamk=") {
    heroname = "Veera";
    namereal = "Veera";
    return;
  }
  if (nameP == "5bCP5LmU") {
    heroname = "Krixi";
    namereal = "Krixi";
    return;
  }
  if (nameP == "5aWO5Lym") {
    heroname = "Quillen";
    namereal = "quillen";
    return;
  }
  if (nameP == "5YiY5aSH" && heroID == 512) {
    heroname = "Rourke";
    namereal = "Rourke";
    return;
  }
  if (nameP == "56iL5ZKs6YeR") {
    heroname = "Tarra";
    namereal = "tarra";
    return;
  }
  if (nameP == "57qi5ouC") {
    heroname = "Zill";
    namereal = "Zill";
    return;
  }
  if (nameP == "5Y+46ams5oe/") {
    heroname = "Paine";
    namereal = "Paine";
    return;
  }
  if (nameP == "5buJ6aKH") {
    heroname = "Toro";
    namereal = "Toro";
    return;
  }
  if (nameP == "5ZOq5ZCS") {
    heroname = "Max";
    namereal = "Max";
    return;
  }
  if (nameP == "NTMzX0hvdVlp") {
    heroname = "Laville";
    namereal = "Laville";
    return;
  }
  if (nameP == "NTMwX0RpcmFr") {
    heroname = "Dirak";
    namereal = "Dirak";
    return;
  }
  if (nameP == "NTA3X0ZsYXNo") {
    heroname = "The Flash";
    namereal = "TheFlash";
    return;
  }
  if (nameP == "SnVZb3VKaW5n") {
    heroname = "Ryoma";
    namereal = "Ryoma";
    return;
  }
  if (nameP == "5p2O5YWD6Iqz") {
    heroname = "Fennik";
    namereal = "Fennik";
    return;
  }
  if (nameP == "54K45by55Lq6") {
    heroname = "Wisp";
    namereal = "Wisp";
    return;
  }
  if (nameP == "5ay05pS/") {
    heroname = "Kahlii";
    namereal = "Kahlii";
    return;
  }
  if (nameP == "5Lic55qH5aSq5LiA") {
    heroname = "Arum";
    namereal = "Arum";
    return;
  }
  if (nameP == "U3VuQ2U=") {
    heroname = "Bijan";
    namereal = "Bijan";
    return;
  }
  if (nameP == "R2VuaXVz") {
    heroname = "Thorne";
    namereal = "Thorne";
    return;
  }
  if (nameP == "55m+6YeM546E562W") {
    heroname = "Enzo";
    namereal = "Enzo";
    return;
  }
  if (nameP == "5byg6Imv") {
    heroname = "Aleister";
    namereal = "Aleister";
    return;
  }
  if (nameP == "MTQxX0RpYW9DaGFu") {
    heroname = "Lauriel";
    namereal = "Lauriel";
    return;
  }
  if (nameP == "MTUyX1dhbmdaaGFvSnVu") {
    heroname = "Điêu Thuyền";
    namereal = "Điêu Thuyền";
    return;
  }
  if (nameP == "5YiY5aSH") {
    heroname = "Moren";
    namereal = "Moren";
    return;
  }
  if (nameP == "MTU0X0h1YU11TGFu") {
    heroname = "Yenna";
    namereal = "Yenna";
    return;
  }
  if (nameP == "MTk5X0xp") {
    heroname = "Elandorr";
    namereal = "Elandorr";
    return;
  }
  if (nameP == "TmluamE=") {
    heroname = "Aoi";
    namereal = "Aoi";
    return;
  }
  if (nameP == "57uu6JCd") {
    heroname = "Keera";
    namereal = "Keera";
    return;
  }
  if (nameP == "5ZCV5biD") {
    heroname = "Maloch";
    namereal = "Maloch";
    return;
  }
  if (nameP == "56We5aWH5aWz5L6g") {
    heroname = "Wonder Woman";
    namereal = "WonderWoman";
    return;
  }
  if (nameP == "5ZCO576/") {
    heroname = "Slimz";
    namereal = "Slimz";
    return;
  }
  if (nameP == "MTE4X1N1bkJpbg==") {
    heroname = "Alice";
    namereal = "Alice";
    return;
  }
  if (nameP == "5pyX5Y2a") {
    heroname = "Lumburr";
    namereal = "Lumburr";
    return;
  }
  if (nameP == "MTIwX0JhaVFp") {
    heroname = "Mina";
    namereal = "Mina";
    return;
  }
  if (nameP == "QWlt") {
    heroname = "Yue";
    namereal = "Yue";
    return;
  }
  if (nameP == "6Iul5LyK") {
    heroname = "Rouie";
    namereal = "Rouie";
    return;
  }
  if (nameP == "NTQwMV9CcmlnaHQ=") {
    heroname = "Bright";
    namereal = "Bright";
    return;
  }
  if (nameP == "MTc3X0NoZW5nSmlTaUhhbg==") {
    heroname = "Lindis";
    namereal = "Lindis";
    return;
  }
  if (nameP == "6auY5riQ56a7") {
    heroname = "Jinna";
    namereal = "Jinna";
    return;
  }
  if (nameP == "6buE5b+g") {
    heroname = "Celica";
    namereal = "Celica";
    return;
  }
  if (nameP == "5qyn57Gz6IyE") {
    heroname = "Omega";
    namereal = "Omega";
    return;
  }
  if (nameP == "R2VuaXVz") {
    heroname = "Bonnie";
    namereal = "Bonnie";
    return;
  }
  if (nameP == "5YiY6YKm") {
    heroname = "Xenniel";
    namereal = "Xenniel";
    return;
  }
  if (nameP == "6JSh5paH5aes") {
    heroname = "Helen";
    namereal = "Helen";
    return;
  }
  if (nameP == "5aSP5L6v5oOH") {
    heroname = "Arduin";
    namereal = "Arduin";
    return;
  }
  if (nameP == "55SE5aes") {
    heroname = "Azzenka";
    namereal = "Azzenka";
    return;
  }
  if (nameP == "55qu55qu") {
    heroname = "Zip";
    namereal = "Zip";
    return;
  }
  if (nameP == "562x5riF") {
    heroname = "Qi";
    namereal = "Qi";
    return;
  }
  if (nameP == "5a6J5qC85YiX") {
    heroname = "Volkath";
    namereal = "Volkath";
    return;
  }
  if (nameP == "MTQwX0d1YW5ZdQ==") {
    heroname = "Supper Man";
    namereal = "supperman";
    return;
  }
  if (nameP == "MTQ4X0ppYW5nWmlZYQ==") {
    heroname = "Preyta";
    namereal = "Preyta";
    return;
  }
  if (nameP == "MTUzX0xhbkxpbmdXYW5n") {
    heroname = "Kaine";
    namereal = "Kaine";
    return;
  }
  if (nameP == "5ouJ5paQ5bCU") {
    heroname = "Amily";
    namereal = "Amily";
    return;
  }
  if (nameP == "MTIxX01pWXVl") {
    heroname = "Marja";
    namereal = "Marja";
    return;
  }
  if (nameP == "5q2m5YiZ5aSp") {
    heroname = "Ilumia";
    namereal = "Ilumia";
    return;
  }
  if (nameP == "6aG55769") {
    heroname = "Thane";
    namereal = "Thane";
    return;
  }
  if (nameP == "5aSq5LmZ55yf5Lq6") {
    heroname = "Teemee";
    namereal = "Teemee";
    return;
  }
  if (nameP == "6Zi/5pav5bSU5b63") {
    heroname = "Astrid";
    namereal = "Astrid";
    return;
  }
  if (nameP == "NTE1X1JpY2h0ZXI=") {
    heroname = "Richter";
    namereal = "Ata";
    return;
  }
  if (nameP == "5byg6aOe") {
    heroname = "Cresh";
    namereal = "Cresh";
    return;
  }
  if (nameP == "5ZGo55Gc") {
    heroname = "Ignis";
    namereal = "Ignis";
    return;
  }
  if (nameP == "MTEzX1podWFuZ1pob3U=") {
    heroname = "Chaugnar";
    namereal = "Chaugnar";
    return;
  }
  if (nameP == "6IuP54OI") {
    heroname = "Wiro";
    namereal = "Wiro";
    return;
  }
  if (nameP == "MTg5X0d1aUd1Wmk=") {
    heroname = "Krizzix";
    namereal = "Krizzix";
    return;
  }
  if (nameP == "NTA1X0JhbGR1bQ==") {
    heroname = "Baldum";
    namereal = "Baldum";
    return;
  }
  if (nameP == "5Y+k5pyo") {
    heroname = "Ybneth";
    namereal = "Ybneth";
    return;
  }
  if (nameP == "Um94aQ==") {
    heroname = "Roxie";
    namereal = "Roxie";
    return;
  }
  if (nameP == "5a6J5aWI54m5") {
    heroname = "Annette";
    namereal = "Annette";
    return;
  }
  if (nameP == "NTIzX0RBUkNZ") {
    heroname = "DArcy";
    namereal = "DArcy";
    return;
  }
  if (nameP == "SXNoYXI=") {
    heroname = "Ishar";
    namereal = "Ishar";
    return;
  }
  if (nameP == "5r6c") {
    heroname = "Sephera";
    namereal = "Sephera";
    return;
  }
  if (nameP == "5aSc5aes") {
    heroname = "Dextra";
    namereal = "Dextra";
    return;
  }

  if (nameP == "5py16I6J5Lqa") {
    heroname = "Dolia";
    namereal = "Dolia";
    return;
  }

  if (nameP == "5aSP5rSb54m5") {
    heroname = "Charlotte";
    namereal = "Charlotter";
    return;
  }

  if (nameP == "6Im+55Cz") {
    heroname = "Erin";
    namereal = "Erin";
    return;
  }

  if (nameP == "6IuP56a7") {
    heroname = "Sinestrea";
    namereal = "Sinestrea";
    return;
  }
  if (nameP == "SWdneQ==") {
    heroname = "Iggy";
    namereal = "Iggy";
    return;
  }
  if (nameP == "NTM5X1NhbHo=") {
    heroname = "Lorion";
    namereal = "Lorion";
    return;
  }
  if (nameP == "VGFjaGk=") {
    heroname = "Tachi";
    namereal = "Tachi";
    return;
  }
  if (nameP == "WWFv") {
    heroname = "Aya";
    namereal = "Aya";
    return;
  }
  if (nameP == "V2hpdGVCb3g=") {
    heroname = "Yan";
    namereal = "Yan";
    return;
  }
  if (nameP == "SGVjYXRl") {
    heroname = "Terri";
    namereal = "Terri";
    return;
  }
  if (nameP == "5piO5LiW6ZqQ") {
    heroname = "Ming";
    namereal = "ming";
    return;
  }

  if (nameP == "54uC6ZOB") {
    heroname = "Biron";
    namereal = "biron";
    return;
  }
  if (nameP == "5Y+456m66ZyH") {
    heroname = "Bolt Baron";
    namereal = "boltbaron";
    return;
  }
  if (nameP == "5q+U5rSb5bCU") {
    heroname = "Billow";
    namereal = "billow";
    return;
  }
  if (nameP == "5rW36K+6") {
    heroname = "Heino";
    namereal = "Heino";
    return;
  }
}

// địch có 5000 / 10000 máu > 1000 dame + 20% = 1200
// tulen lv15 - 2000 công phép - tăng 20%
// 600 + 1200 + 1200  = 3000

// 100 công phép = 1%

// "600 + 563
// 1163"

// bắn 3000 dame
// địch có 5000 giáp phép

// 401 471