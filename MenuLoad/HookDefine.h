void hook1() {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    
    // --- Dispatch: Khởi tạo Offset Toàn cục & Hook ---
    // Gom nhóm vào một luồng xử lý để tránh lỗi scope biến cục bộ
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.33333 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    ActorLinkerOffField[0] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Kyrios.Actor"),oxorany("ActorLinker"),oxorany("ValueComponent"));
    ActorLinkerOffField[1] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Kyrios.Actor"),oxorany("ActorLinker"),oxorany("HudControl"));
    ActorLinkerOffField[2] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Kyrios.Actor"),oxorany("ActorLinker"),oxorany("CharInfo"));
    ActorLinkerOffField[3] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Kyrios.Actor"),oxorany("ActorLinker"),oxorany("ObjLinker"));
    ActorLinkerOffField[4] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Kyrios.Actor"),oxorany("ActorLinker"),oxorany("EquipLinkerComp"));
    ActorLinkerOffField[5] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Kyrios.Actor"),oxorany("ActorLinker"),oxorany("SkillControl"));
    ActorLinkerOffField[6] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Assets.Scripts.GameLogic"),oxorany("SkillComponent"),oxorany("SkillSlotArray"));
    ActorLinkerOffField[7] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Assets.Scripts.GameLogic"),oxorany("SkillSlot"),oxorany("skillIndicator"));
    ActorLinkerOffField[8] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Assets.Scripts.GameLogic"),oxorany("SkillControlIndicator"),oxorany("curindicatorDistance"));
    ActorLinkerOffField[9] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Assets.Scripts.GameLogic"),oxorany("SkillControlIndicator"),oxorany("useSkillDirection"));
    ActorLinkerOffField[10] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Assets.Scripts.GameLogic"),oxorany("SkillControlIndicator"),oxorany("useSkillPosition"));
    ActorLinkerOffField[11] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Assets.Scripts.GameLogic"),oxorany("ActorConfig"),oxorany("ConfigID"));
    ActorLinkerOffField[12] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Kyrios.Actor"),oxorany("HeroWrapperData"),oxorany("heroWrapSkillData_1"));
    ActorLinkerOffField[13] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Kyrios.Actor"),oxorany("HeroWrapperData"),oxorany("heroWrapSkillData_2"));
    ActorLinkerOffField[14] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Kyrios.Actor"),oxorany("HeroWrapperData"),oxorany("heroWrapSkillData_3"));
    ActorLinkerOffField[15] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Kyrios.Actor"),oxorany("HeroWrapperData"),oxorany("heroWrapSkillData_5"));
    ActorLinkerOffField[16] = GET_FIELDS(oxorany("Project.Plugins_d.dll"),oxorany("NucleusDrive.Share"),oxorany("HeroWrapSkillData"),oxorany("Skill1SlotCD"));
    ActorLinkerOffField[17] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Kyrios.Actor"),oxorany("ActorLinker"),oxorany("BuffControl"));
    ActorLinkerOffField[18] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Assets.Scripts.GameLogic"),oxorany("BuffLinkerComponent"),oxorany("SpawnedBuffList"));
    ActorLinkerOffField[19] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Assets.Scripts.GameLogic"),oxorany("SkillComponent"),oxorany("curSkilSlot"));
    ActorLinkerOffField[20] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Assets.Scripts.GameLogic"),oxorany("SkillControlIndicator"),oxorany("useOffsetPosition"));
    ActorLinkerOffField[21] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Assets.Scripts.GameLogic"),oxorany("SkillControlIndicator"),oxorany("useSkillPosition"));
    ActorLinkerOffField[22] = GET_FIELDS(oxorany("Project_d.dll"),oxorany("Kyrios.Actor"),oxorany("HeroWrapperData"),oxorany("heroWrapSkillData_ex3"));

    
      Reqskill = (bool (*)(void *))GET_OFFSET("Project_d.dll", "Assets.Scripts.GameLogic", "SkillSlot", "RequestUseSkill", 0);
      Reqskill2 = (bool (*)(void *, bool))GET_OFFSET("Project_d.dll", "Assets.Scripts.GameLogic", "SkillSlot", "ReadyUseSkill", 1);
      get_mainfov = (void *(*)(void *))GET_OFFSET("UnityEngine.CoreModule.dll", "UnityEngine", "Camera", "get_main", 0);
      set_fieldOfView = (void (*)(void *, float))GET_OFFSET("UnityEngine.CoreModule.dll", "UnityEngine", "Camera", "set_fieldOfView", 1);
      SetPlayerName = (void (*)(void*, MonoString*, MonoString*, bool, MonoString*))((uintptr_t)GET_OFFSET(oxorany("Project_d.dll"),oxorany("Assets.Scripts.GameLogic"),oxorany("HudComponent3D"),oxorany("SetPlayerName"), 4));

      ActorLinker_IsHostPlayer = (bool (*)(void *))GET_OFFSET("Project_d.dll", "Kyrios.Actor", "ActorLinker", "IsHostPlayer", 0);
      ActorLinker_IsHostCamp = (bool (*)(void *))GET_OFFSET("Project_d.dll", "Kyrios.Actor", "ActorLinker", "IsHostCamp", 0);
      ActorLinker_ActorTypeDef = (int (*)(void *))GET_OFFSET("Project_d.dll", "Kyrios.Actor", "ActorLinker", "get_objType", 0);
      ActorLinker_COM_PLAYERCAMP = (int (*)(void *))GET_OFFSET("Project_d.dll", "Kyrios.Actor", "ActorLinker", "get_objCamp", 0);
      ActorLinker_getPosition = (Vector3(*)(void *))GET_OFFSET("Project_d.dll", "Kyrios.Actor", oxorany("ActorLinker"), "get_position", 0);
      ActorLinker_get_bVisible = (bool (*)(void *))GET_OFFSET("Project_d.dll", "Kyrios.Actor", "ActorLinker", "get_bVisible", 0);
      LActorRoot_LHeroWrapper = (uintptr_t(*)(void *))GET_OFFSET("Project.Plugins_d.dll", "NucleusDrive.Logic", "LActorRoot", "AsHero", 0);
      LActorRoot_COM_PLAYERCAMP = (int (*)(void *))GET_OFFSET("Project.Plugins_d.dll", "NucleusDrive.Logic", "LActorRoot", "GiveMyEnemyCamp", 0);
      LObjWrapper_get_IsDeadState = (bool (*)(void *))GET_OFFSET("Project.Plugins_d.dll", "NucleusDrive.Logic", "LObjWrapper", "get_IsDeadState", 0);
      LObjWrapper_IsAutoAI = (bool (*)(void *))GET_OFFSET("Project.Plugins_d.dll", "NucleusDrive.Logic", "LObjWrapper", "IsAutoAI", 0);

      ValuePropertyComponent_get_actorHp = (int (*)(void *))GET_OFFSET("Project.Plugins_d.dll", "NucleusDrive.Logic", "ValuePropertyComponent", "get_actorHp", 0);
      ValuePropertyComponent_get_actorHpTotal = (int (*)(void *))GET_OFFSET("Project.Plugins_d.dll", "NucleusDrive.Logic", "ValuePropertyComponent", "get_actorHpTotal", 0);

      AsHero = (uintptr_t(*)(void *))GET_OFFSET(oxorany("Project_d.dll"), oxorany("Kyrios.Actor"), oxorany("ActorLinker"), oxorany("AsHero"), 0);
      ValueLinkerComponent_get_actorHp = (int (*)(void *))GET_OFFSET(oxorany("Project_d.dll"), oxorany("Kyrios.Actor"), oxorany("ValueLinkerComponent"), oxorany("get_actorHp"), 0);
      ValueLinkerComponent_get_actorHpTotal = (int (*)(void *))GET_OFFSET(oxorany("Project_d.dll"), oxorany("Kyrios.Actor"), oxorany("ValueLinkerComponent"), oxorany("get_actorHpTotal"), 0);
      ValueLinkerComponent_get_actorSoulLevel = (int (*)(void *))GET_OFFSET(oxorany("Project_d.dll"), oxorany("Kyrios.Actor"), oxorany("ValueLinkerComponent"), oxorany("get_actorSoulLevel"), 0);
      ValueLinkerComponent_get_actorMgcAtkPTTotal = (int (*)(void *))GET_OFFSET(oxorany("Project_d.dll"), oxorany("Kyrios.Actor"), oxorany("ValueLinkerComponent"), oxorany("get_actorMgcAtkPTTotal"), 0);
      ActorLinker_AsHero = (void*(*)(void*))GET_OFFSET(oxorany("Project_d.dll"), oxorany("Kyrios.Actor"), oxorany("ActorLinker"), oxorany("AsHero"), 0);

      get_SkillID = (int (*)(void *))((uintptr_t)GET_OFFSET(oxorany("Project_d.dll"), oxorany("Assets.Scripts.GameLogic"), oxorany("BuffSkill"), oxorany("get_SkillID"), 0));
      ActorLinker_get_ObjID = (int (*)(void *))GET_OFFSET("Project_d.dll", "Kyrios.Actor", "ActorLinker", "get_ObjID", 0);
      ActorLinker_get_playerId = (int (*)(void *))GET_OFFSET(oxorany("Project_d.dll"), oxorany("Kyrios.Actor"), oxorany("ActorLinker"), oxorany("get_playerId"), 0);
      old_RefreshHeroPanel = (void (*)(void *, bool, bool, bool))GET_OFFSET("Project_d.dll", "Assets.Scripts.GameSystem", "HeroSelectNormalWindow", "RefreshHeroPanel", 3);
      ForceKillCrystal = (void (*)(int))GET_OFFSET(oxorany("Project_d.dll"), oxorany("Assets.Scripts.GameLogic"), oxorany("LobbyMsgHandler"), oxorany("ForceKillCrystal"), 1);
      LActorRoot_AsHero = (void *(*)(void *))GET_OFFSET("Project.Plugins_d.dll", "NucleusDrive.Logic", "LActorRoot", "AsHero", 0);

      GetCurSkillSlotType = (int (*)(void *))GET_OFFSET("Project_d.dll", "Assets.Scripts.GameSystem", "CSkillButtonManager", "GetCurSkillSlotType", 0);
      LHeroWrapper_GetHeroWrapSkillData = (HeroWrapSkillData(*)(void *, int))GET_OFFSET("Project.Plugins_d.dll", "NucleusDrive.Logic", "LHeroWrapper", "GetHeroWrapSkillData", 1);
      LActorRoot_get_ObjID = (int (*)(void *))GET_OFFSET("Project.Plugins_d.dll", "NucleusDrive.Logic", "LActorRoot", "get_ObjID", 0);
      get_main = (void *(*)())GET_OFFSET("UnityEngine.CoreModule.dll", "UnityEngine", "Camera", "get_main", 0);
      WorldToScreens = (Vector3(*)(void *, Vector3, int))GET_OFFSET(("UnityEngine.CoreModule.dll"), ("UnityEngine"), ("Camera"), ("WorldToViewportPoint"), 2);
      LActorRoot_get_PlayerMovement = (void *(*)(void *))GET_OFFSET("Project.Plugins_d.dll", "NucleusDrive.Logic", "LActorRoot", "get_PlayerMovement", 0);
      get_speed = (int (*)(void *))GET_OFFSET("Project.Plugins_d.dll", "NucleusDrive.Logic", "PlayerMovement", "get_speed", 0);
      // 2. Khai báo Offset cục bộ (Local Hook Offsets)
      uint64_t OnClickSelectHeroSkinOffset = GET_OFFSET("Project_d.dll", "Assets.Scripts.GameSystem", "HeroSelectNormalWindow", "OnClickSelectHeroSkin", 2);
      uint64_t IsCanUseSkinOffset = GET_OFFSET("Project_d.dll", "Assets.Scripts.GameSystem", "CRoleInfo", "IsCanUseSkin", 2);
      uint64_t GetHeroWearSkinIdOffset = GET_OFFSET("Project_d.dll", "Assets.Scripts.GameSystem", "CRoleInfo", "GetHeroWearSkinId", 1);
      uint64_t IsHaveHeroSkinOffset = GET_OFFSET("Project_d.dll", "Assets.Scripts.GameSystem", "CRoleInfo", "IsHaveHeroSkin", 3);
      uint64_t GetskinOffset = GET_OFFSET("Project_d.dll", "Assets.Scripts.GameLogic", "CActorInfo", "GetSkin", 1);
      uint64_t unpackOffset = GET_OFFSET("AovTdr.dll", "CSProtocol", "COMDT_HERO_COMMON_INFO", "unpack", 2);
      uint64_t camoffset = GET_OFFSET("Project_d.dll", "", "CameraSystem", "GetZoomRate", 0);
      uint64_t updateoffset = GET_OFFSET("Project_d.dll", "", "CameraSystem", "Update", 0);
      uint64_t oncamoffset = GET_OFFSET("Project_d.dll", "", "CameraSystem", "OnCameraHeightChanged", 0);
      uint64_t actorlink_updateoffset = GET_OFFSET("Project_d.dll", oxorany("Kyrios.Actor"), oxorany("ActorLinker"), oxorany("Update"), 0);
      uint64_t lactor_destroy = GET_OFFSET("Project.Plugins_d.dll", oxorany("NucleusDrive.Logic"), oxorany("LActorRoot"), oxorany("DestroyActor"), 1);
      uint64_t actorlink_destroyoffset = GET_OFFSET("Project_d.dll", oxorany("Kyrios.Actor"), oxorany("ActorLinker"), oxorany("DestroyActor"), 0);
      uint64_t updatelogicoffset = GET_OFFSET(oxorany("Project_d.dll"), oxorany("Assets.Scripts.GameSystem"), oxorany("CSkillButtonManager"), oxorany("UpdateLogic"), 1);
      uint64_t lactor_updatelogic = GET_OFFSET("Project.Plugins_d.dll", oxorany("NucleusDrive.Logic"), oxorany("LActorRoot"), oxorany("UpdateLogic"), 1);
      uint64_t lateupdatecamv2offset = GET_OFFSET("Project_d.dll", oxorany("Kyrios.Actor"), oxorany("ActorLinker"), oxorany("LateUpdate"), 0);
      uint64_t skilldirectoffset = GET_OFFSET(oxorany("Project_d.dll"), oxorany("Assets.Scripts.GameLogic"), oxorany("SkillControlIndicator"), oxorany("GetUseSkillDirection"), 1);
      uint64_t skillpositionoffset = GET_OFFSET("Project_d.dll", oxorany("Assets.Scripts.GameLogic"), oxorany("SkillControlIndicator"), oxorany("GetUseSkillPosition"), 1);

      uint64_t offsetcoban1 = GET_OFFSET("Project_d.dll", oxorany(""), oxorany("MiniMapHeroInfo"), oxorany("ShowHeroHpInfo"), 1);
      uint64_t offsetcoban2 = GET_OFFSET("Project.Plugins_d.dll", oxorany("NucleusDrive.Logic"), oxorany("LVActorLinker"), oxorany("SetVisible"), 3);
      uint64_t offsetcoban3 = GET_OFFSET("Project_d.dll", oxorany("Assets.Scripts.GameSystem"), oxorany("HeroInfoPanel"), oxorany("ShowHeroInfo"), 2);
      uint64_t offsetcoban4 = GET_OFFSET("Project_d.dll", oxorany(""), oxorany("MiniMapHeroInfo"), oxorany("ShowSkillStateInfo"), 1);

      uint64_t offsetanti1 = GET_OFFSET("Project.Plugins_d.dll", oxorany("NucleusDrive.Logic"), oxorany("LSynchrReport"), oxorany("OnConstruct"), 0);
      uint64_t offsetanti2 = GET_OFFSET("Project_d.dll", oxorany("GCloud.AnoSDK"), oxorany("AnoSDK"), oxorany("AnoSDKOnRecvSignature"), 4);
      uint64_t offsetanti3 = GET_OFFSET("Project_d.dll", oxorany("GCloud.AnoSDK"), oxorany("AnoSDK"), oxorany("OnRecvSignature"), 4);
      uint64_t offsetanti4 = GET_OFFSET("Project.Plugins_d.dll", oxorany("NucleusDrive.Logic"), oxorany("LSynchrReport"), oxorany("EnqueHashValueByFrameNum"), 2);
      uint64_t offsetanti5 = GET_OFFSET("Project.Plugins_d.dll", oxorany("NucleusDrive.Logic"), oxorany("LSynchrReport"), oxorany("SampleFrameSyncData"), 0);
      uint64_t offsetanti6 = GET_OFFSET("Project_d.dll", oxorany("GCloud.AnoSDK"), oxorany("AnoSDK"), oxorany("AnoSDKGetReportData"), 0);
      uint64_t offsetanti7 = GET_OFFSET("Project_d.dll", oxorany("GCloud.AnoSDK"), oxorany("AnoSDK"), oxorany("AnoSDKGetReportData2"), 0);
      uint64_t offsetanti8 = GET_OFFSET("Project_d.dll", oxorany("GCloud.AnoSDK"), oxorany("AnoSDK"), oxorany("AnoSDKGetReportData3"), 0);
      uint64_t offsetanti9 = GET_OFFSET("Project_d.dll", oxorany("GCloud.AnoSDK"), oxorany("AnoSDK"), oxorany("SetUserInfo"), 2);
      uint64_t CSkillButtonManager_LateUpdate = GET_OFFSET("Project_d.dll", "Assets.Scripts.GameSystem", "CSkillButtonManager", "LateUpdate", 0);
      uint64_t offsetGetPlayer = GET_OFFSET("Project.Plugins_d.dll", "NucleusDrive.Logic.GameKernal", "GamePlayerCenter", "GetPlayer", 1);
      uint64_t offsetLBUpdateLogic = GET_OFFSET("Project_d.dll", "Assets.Scripts.GameLogic", "LobbyLogic", "UpdateLogic", 1);
      uint64_t offsetSkillDirection = GET_OFFSET("Project_d.dll", "Assets.Scripts.GameLogic", "SkillControlIndicator", "GetUseSkillDirection", 1);
      uint64_t offsetSkillBtnLateUpdate = GET_OFFSET("Project_d.dll", "Assets.Scripts.GameSystem", "CSkillButtonManager", "LateUpdate", 0);

      uint64_t ActorLinker_Update_Off = GET_OFFSET("Project_d.dll", "Kyrios.Actor", "ActorLinker", "Update", 0);
      uint64_t ActorLinker_DestroyActor_Off = GET_OFFSET("Project_d.dll", "Kyrios.Actor", "ActorLinker", "DestroyActor", 0);

      uint64_t LActorRoot_UpdateLogic_Off = GET_OFFSET("Project.Plugins_d.dll", "NucleusDrive.Logic", "LActorRoot", "UpdateLogic", 1);
      uint64_t LActorRoot_DestroyActor_Off = GET_OFFSET("Project.Plugins_d.dll", "NucleusDrive.Logic", "LActorRoot", "DestroyActor", 1);

      HookDelay(camoffset - getASLR("UnityFramework"), _cam, cam);
      HookDelay(oncamoffset - getASLR("UnityFramework"), _highrate, highrate);
      HookDelay(lateupdatecamv2offset - getASLR("UnityFramework"), LateUpdatee, old_LateUpdate);
      HookDelay(updateoffset - getASLR("UnityFramework"), _Update, Update);
      HookDelay(GetHeroWearSkinIdOffset - getASLR("UnityFramework"), GetHeroWearSkinId, old_GetHeroWearSkinId);
      HookDelay(unpackOffset - getASLR("UnityFramework"), unpack, old_unpack);

      HookDelay(IsHaveHeroSkinOffset - getASLR("UnityFramework"), IsHaveHeroSkin, old_IsHaveHeroSkin);
      HookDelay(IsCanUseSkinOffset - getASLR("UnityFramework"), IsCanUseSkin, old_IsCanUseSkin);
      HookDelay(OnClickSelectHeroSkinOffset - getASLR("UnityFramework"), OnClickSelectHeroSkin, old_OnClickSelectHeroSkin);

      HookUnity(offsetcoban1 - getASLR("UnityFramework"), ShowHeroHpInfo, _ShowHeroHpInfo);
      HookUnity(offsetcoban3 - getASLR("UnityFramework"), ShowHeroInfo, _ShowHeroInfo);
      HookUnity(offsetcoban4 - getASLR("UnityFramework"), ShowSkillStateInfo, _ShowSkillStateInfo);

      HookDelay(offsetcoban2 - getASLR("UnityFramework"), LActorRoot_Visible, _LActorRoot_Visible);
      HookDelay(offsetSkillDirection - getASLR("UnityFramework"), GetUseSkillDirection, _GetUseSkillDirection);                        // public Vector3 GetUseSkillDirection(bool isTouchUse = False)
      HookDelay(offsetSkillBtnLateUpdate - getASLR("UnityFramework"), SkillButtonManager_LateUpdate, _SkillButtonManager_LateUpdate);  // public void LateUpdate()//private bool CanChargingSkill(SkillSlotType skillSlotType)
      HookDelay(ActorLinker_Update_Off - getASLR("UnityFramework"), ActorLinker_Update, old_ActorLinker_Update);
      HookDelay(ActorLinker_DestroyActor_Off - getASLR("UnityFramework"), ActorLinker_ActorDestroy, old_ActorLinker_ActorDestroy);
      HookDelay(LActorRoot_UpdateLogic_Off - getASLR("UnityFramework"), LActorRoot_UpdateLogic, old_LActorRoot_UpdateLogic);
      HookDelay(LActorRoot_DestroyActor_Off - getASLR("UnityFramework"), LActorRoot_ActorDestroy, old_LActorRoot_ActorDestroy);
      HookDelay(offsetGetPlayer - getASLR("UnityFramework"), Emilia, _Emilia);
      HookDelay(offsetLBUpdateLogic - getASLR("UnityFramework"), Mahiru, _Mahiru);
      // HookUnity(0x5ad8fac, Skslot, _Skslot); // autobocpha
      // HookDelay(0x512544C,Buttonid, _Buttonid);////private static int get_PersonalBtnId()
      // HookDelay(0x5124A38,IsOpen,_IsOpen);////public static bool IsOpen()   2

      /* // 3. Thực hiện Hook (Phân tầng theo thời gian)
           // HookUnity(actorlink_updateoffset, ActorLinker_Update, old_ActorLinker_Update);
           // HookUnity(lactor_updatelogic, LActorRoot_UpdateLogic, old_LActorRoot_UpdateLogic);
           // HookUnity(updatelogicoffset, UpdateLogic, _UpdateLogic);

           dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.33333 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
               HookUnity(camoffset, _cam, cam);

               dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.33333 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                   HookUnity(oncamoffset, _highrate, highrate);
                   // HookUnity(actorlink_destroyoffset, ActorLinker_ActorDestroy, old_ActorLinker_ActorDestroy);
                   // HookUnity(lactor_destroy, LActorRoot_ActorDestroy, old_LActorRoot_ActorDestroy);

                   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.33333 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                       HookUnity(lateupdatecamv2offset, LateUpdatee, old_LateUpdate);
                       // HookUnity(skilldirectoffset, GetUseSkillDirection, _GetUseSkillDirection);
                       // HookUnity(skillpositionoffset, GetUseSkillPosition, _GetUseSkillPosition);

                       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.333333 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                           HookUnity(updateoffset, _Update, Update);
                           HookUnity(GetHeroWearSkinIdOffset, GetHeroWearSkinId, old_GetHeroWearSkinId);
                           HookUnity(unpackOffset, unpack, old_unpack);

                           dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                               HookUnity(IsHaveHeroSkinOffset, IsHaveHeroSkin, old_IsHaveHeroSkin);
                               HookUnity(IsCanUseSkinOffset, IsCanUseSkin, old_IsCanUseSkin);
                               HookUnity(OnClickSelectHeroSkinOffset, OnClickSelectHeroSkin, old_OnClickSelectHeroSkin);

                               dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                   // HookUnity(offsetcoban1, ShowHeroHpInfo, _ShowHeroHpInfo);
                                   // HookUnity(offsetcoban2, LActorRoot_Visible, _LActorRoot_Visible);
                                   // HookUnity(offsetcoban3, ShowHeroInfo, _ShowHeroInfo);
                                   // HookUnity(offsetcoban4, ShowSkillStateInfo, _ShowSkillStateInfo);*/

      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // Patch(offsetanti1, "C0035FD6");
        // Patch(offsetanti2, "C0035FD6");
        // Patch(offsetanti3, "C0035FD6");
        // Patch(offsetanti4, "C0035FD6");
        // Patch(offsetanti5, "C0035FD6");
        // Patch(offsetanti6, "C0035FD6");
        // Patch(offsetanti7, "C0035FD6");
        // Patch(offsetanti8, "C0035FD6");
        Patch(offsetanti9, "C0035FD6");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
          // ActiveOff(offsetanti1, "C0035FD6");
          // ActiveOff(offsetanti2, "C0035FD6");
          // ActiveOff(offsetanti3, "C0035FD6");
          // ActiveOff(offsetanti4, "C0035FD6");
          // ActiveOff(offsetanti5, "C0035FD6");
          // ActiveOff(offsetanti6, "C0035FD6");
          // ActiveOff(offsetanti7, "C0035FD6");
          // ActiveOff(offsetanti8, "C0035FD6");
          ActiveOff(offsetanti9, "C0035FD6");
        });
      });
    });
  });
} /*);
});
});
});*/
// Kết thúc dispatch đầu tiên (bao gồm cả định nghĩa và hook)
// Kết thúc dispatch_once

void DOITEN() {
  dispatch_async(dispatch_get_main_queue(), ^{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *savedPlayerName = [defaults stringForKey:@"g_playerName"];
    NSString *savedPrefixName = [defaults stringForKey:@"g_prefixName"];
    if (!savedPlayerName) {
      g_playerName = "TruongMod";
    } else {
      g_playerName = [savedPlayerName UTF8String];
    }
    if (!savedPrefixName) {
      g_prefixName = "AOV";
    } else {
      g_prefixName = [savedPrefixName UTF8String];
    }
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Đổi tên player ingame" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
      textField.placeholder = @"tên vàng";
      textField.text = [NSString stringWithUTF8String:g_prefixName.c_str()];
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
      textField.placeholder = @"tên trắng";
      textField.text = [NSString stringWithUTF8String:g_playerName.c_str()];
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action) {
                                                       MenDeal = true;
                                                       g_playerName = std::string([alertController.textFields[1].text UTF8String]);
                                                       g_prefixName = std::string([alertController.textFields[0].text UTF8String]);
                                                       [defaults setObject:[NSString stringWithUTF8String:g_playerName.c_str()] forKey:@"g_playerName"];
                                                       [defaults setObject:[NSString stringWithUTF8String:g_prefixName.c_str()] forKey:@"g_prefixName"];
                                                       [defaults synchronize];
                                                     }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    [rootViewController presentViewController:alertController animated:YES completion:nil];
  });
}
// [[maintool sharemain] activehack];

// bước log pick tướng xong qua bản hack chọn skin
// on prepare battle qua gốc đợi tới lúc gốc vào trận ( đặt thông báo tầm 15s )
// vô hack chơi như bth
// lúc chết nhấn nút log qua gốc rồi nhảy về bản gốc
// tdkt tự quay về gốc
// gốc hiện kết nối thât bại thì thoát gốc rồi vào lại rồi làm như bước đầ