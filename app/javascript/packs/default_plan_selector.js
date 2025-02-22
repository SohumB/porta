// @flow

import { DefaultPlanSelectCardWrapper } from 'Plans'
import { safeFromJsonString } from 'utilities'

import type { Record as Plan } from 'Types'

document.addEventListener('DOMContentLoaded', () => {
  const containerId = 'default_plan'
  const container = document.getElementById(containerId)

  if (!container) {
    return
  }

  const { dataset } = container
  const plans = safeFromJsonString<Plan[]>(dataset.applicationPlans) || []
  const initialDefaultPlan = safeFromJsonString<Plan>(dataset.currentPlan) || null
  const path: string = dataset.path

  DefaultPlanSelectCardWrapper({
    initialDefaultPlan,
    plans: plans,
    path
  }, containerId)
})
