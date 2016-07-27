--Deep Anglerfish
--  By Shad3
--  No Deep Anglerfish Jr. So no Special Summon part (still built like it's about to SpSummon)

local self=c511005065

function self.initial_effect(c)
  local e1=Effect.CreateEffect(c)
  e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_F)
  e1:SetCode(EVENT_BATTLE_DESTROYED)
  e1:SetCategory(CATEGORY_TOGRAVE+CATEGORY_SPECIAL_SUMMON)
  e1:SetDescription(aux.Stringid(511005065,0))
  e1:SetCondition(self.cd)
  e1:SetTarget(self.tg)
  e1:SetOperation(self.op)
  c:RegisterEffect(e1)
end

function self.cd(e,tp,eg,ep,ev,re,r,rp)
  return e:GetHandler():IsLocation(LOCATION_GRAVE) and e:GetHandler():IsReason(REASON_BATTLE)
end

function self.tg(e,tp,eg,ep,ev,re,r,rp,chk)
  if chk==0 then return true end
  Duel.SetOperationInfo(0,CATEGORY_TOGRAVE,nil,1,tp,LOCATION_DECK)
end

function self.fil(c)
  return c:IsType(TYPE_FISH) and c:IsAbleToGrave()
end

function self.op(e,tp,eg,ep,ev,re,r,rp)
  Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
  local tg=Duel.SelectMatchingCard(tp,self.fil,tp,LOCATION_DECK,0,1,1,nil)
  if tg:GetCount()~=0 then
    if Duel.SendtoGrave(tg,REASON_EFFECT)~=0 then
      --Special Summon the nonexisting Deep Anglerfish Jr.
    end
  else
    local dg=Duel.GetFieldGroup(tp,LOCATION_DECK,0)
    Duel.ConfirmCards(tp,dg)
    Duel.ConfirmCards(1-tp,dg)
    Duel.ShuffleDeck(tp)
  end
end