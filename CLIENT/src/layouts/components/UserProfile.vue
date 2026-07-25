<script setup>
import { computed } from 'vue'
import { useAuthStore } from "@/plugins/auth.module"
import avatar1 from "@images/avatars/avatar-1.png"
import { default as constant } from "@/constants"

const authStore = useAuthStore()
const user = computed(() => authStore.user)

const userAvatar = computed(() => {
  if (user.value?.photo_path) {
    return constant.storagePath + user.value.photo_path
  }
  
  return avatar1
})

const onLogout = () => {
  useAuthStore().logout()
}
</script>

<template>
  <VBadge
    dot
    location="bottom right"
    offset-x="3"
    offset-y="3"
    bordered
    color="success"
  >
    <VAvatar
      class="cursor-pointer"
      color="primary"
      variant="tonal"
    >
      <VImg :src="userAvatar" />

      <!-- SECTION Menu -->
      <VMenu
        activator="parent"
        width="230"
        location="bottom end"
        offset="14px"
      >
        <VList>
          <!-- 👉 User Avatar & Name -->
          <VListItem>
            <template #prepend>
              <VListItemAction start>
                <VBadge
                  dot
                  location="bottom right"
                  offset-x="3"
                  offset-y="3"
                  color="success"
                >
                  <VAvatar
                    color="primary"
                    variant="tonal"
                  >
                    <VImg :src="userAvatar" />
                  </VAvatar>
                </VBadge>
              </VListItemAction>
            </template>

            <VListItemTitle class="font-weight-semibold">
              {{ user.username }}
            </VListItemTitle>
            <VListItemSubtitle>{{ user.email }}</VListItemSubtitle>
          </VListItem>

          <VDivider class="my-2" />

          <!-- 👉 Profile -->
          <VListItem
            link
            to="/settings/account-settings"
          >
            <template #prepend>
              <VIcon
                class="me-2"
                icon="mdi-cog"
                size="22"
              />
            </template>

            <VListItemTitle>{{ $t("Preference Settings") }}</VListItemTitle>
          </VListItem>

          <!-- Divider -->
          <VDivider class="my-2" />

          <!-- 👉 Logout -->
          <VListItem @click.prevent="onLogout">
            <template #prepend>
              <VIcon
                class="me-2"
                icon="tabler-logout"
                size="22"
              />
            </template>

            <VListItemTitle>{{ $t("Logout") }}</VListItemTitle>
          </VListItem>
        </VList>
      </VMenu>
      <!-- !SECTION -->
    </VAvatar>
  </VBadge>
</template>
