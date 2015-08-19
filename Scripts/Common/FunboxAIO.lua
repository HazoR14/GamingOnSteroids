--
--
--   F U N B O X    A  I  O
--           1 . 0
--
-- L E B L A N C
if GetObjectName(GetMyHero()) == "Leblanc" then
  PrintChat("Funbox Leblanc")
  OnLoop(function(myHero)
    local t = GetTarget(850)
    local pw = GetPredictionForPlayer(GetOrigin(GetMyHero()), t, GetMoveSpeed(t), 2000, 500, 850, 120, false, true)
    local pe = GetPredictionForPlayer(GetOrigin(GetMyHero()), t, GetMoveSpeed(t), 2000, 500, 850, 55, true, true)
    if KeyIsDown(0x20) and ValidTarget(t, 850) then
      if CanUseSpell(myHero, _R) == 5 or CanUseSpell(myHero, _R) == 2 then
        if CanUseSpell(myHero, _Q) == 0 then
          CastTargetSpell(t, _Q)
        end
        if CanUseSpell(myHero, _W) == 0 and pw.HitChance == 1 and GotBuff(myHero, "LeblancSlide") == 0 then
          CastSkillShot(_W, pw.PredPos.x, pw.PredPos.y, pw.PredPos.z)
        end
        if CanUseSpell(myHero, _E) == 0 and pe.HitChance == 1 and GetDistance(t, myHero) > 150 then
          CastSkillShot(_E, pe.PredPos.x, pe.PredPos.y, pe.PredPos.z)
        end
      end
      if CanUseSpell(myHero, _R) == 0 and GotBuff(myHero, "LeblancSlideM") == 0 then
        if CanUseSpell(myHero, _Q) == 0 then
          CastTargetSpell(t, _Q)
        end
        if CanUseSpell(myHero, _Q) == 5 then
          CastTargetSpell(t, _R)
        end
      end
    end
  end)
end
-- L U C I A N
if GetObjectName(GetMyHero()) == "Lucian" then
  PrintChat("Funbox Lucian")
  OnLoop(function(myHero)
    local t = GetTarget(675)
    local pw = GetPredictionForPlayer(GetOrigin(GetMyHero()), t, GetMoveSpeed(t), 2000, 300, 1000, 80, false, true)
    if KeyIsDown(0x20) and GotBuff(myHero, "lucianpassivebuff") == 1 then
      AttackUnit(t)
    end
    if KeyIsDown(0x20) and ValidTarget(t, 675) then
      if CanUseSpell(myHero, _Q) == 0 then
        CastTargetSpell(t, _Q)
      elseif CanUseSpell(myHero, _W) == 0 then
        DelayAction(function()
          if GotBuff(myHero, "lucianpassivebuff") == 0 then
            CastSkillShot(_W, pw.PredPos.x, pw.PredPos.y, pw.PredPos.z)
          end
        end, 500)
      end
    end
  end)
end
-- R E N G A R
if GetObjectName(GetMyHero()) == "Rengar" then
  PrintChat("Funbox Rengar")
  OnLoop(function(myHero)
    local ts = GetTarget(1000)
    local tc = GetTarget(350)
    local taa = GetTarget(240)
    local pef = GetPredictionForPlayer(GetOrigin(GetMyHero()), ts, GetMoveSpeed(ts), 1600, 250, 1000, 60, true, true)
    local pet = GetPredictionForPlayer(GetOrigin(GetMyHero()), tc, GetMoveSpeed(tc), 1600, 250, 350, 60, true, true)
    if GetCurrentHP(myHero) < 500 and GetCurrentMana(myHero) == 5 then
      CastSpell(_W)
    end
    if KeyIsDown(0x20) then
      if GotBuff(myHero, "rengarqbase") == 1 or GotBuff(myHero, "rengarqemp") == 1 or GotBuff(myHero, "rengarwbuff") == 1 or GotBuff(ts, "rengareslow") == 1 or GotBuff(ts, "RengarEFinalMAX") == 1 then
        AttackUnit(taa)
      end
      if GetCurrentMana(myHero) <= 4 then
        if ValidTarget(ts, 900) and CanUseSpell(myHero, _Q) == 0 and GotBuff(myHero, "rengarpassivebuff") == 1 then
          CastSpell(_Q)
        end
        if CanUseSpell(myHero, _Q) == 0 and ValidTarget(tc, 250) then
          CastSpell(_Q)
        end
        if CanUseSpell(myHero, _W) == 0 and ValidTarget(tc, 350) then
          CastSpell(_W)
        end
        if CanUseSpell(myHero, _E) == 0 and ValidTarget(tc, 350) then
          CastSkillShot(_E, pet.PredPos.x, pet.PredPos.y, pet.PredPos.z)
        end
        if GotBuff(myHero, "rengarpassivebuff") == 0 then
          if CanUseSpell(myHero, _E) == 0 and ValidTarget(ts, 1000) then
            CastSkillShot(_E, pef.PredPos.x, pef.PredPos.y, pef.PredPos.z)
          end
        end
      end
      if GetCurrentMana(myHero) == 5 then
        if GetCurrentHP(myHero) >= 500 then
          if ValidTarget(tc, 250) then
            CastSpell(_Q)
          end
          if GotBuff(myHero, "rengarpassivebuff") == 1 then
            if ValidTarget(ts, 800) then
              CastSpell(_Q)
            end
          end
        end
      end
    end
  end)
end