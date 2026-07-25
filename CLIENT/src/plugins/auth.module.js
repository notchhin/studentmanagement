// import { useLocalStorage } from "@vueuse/core"
import User from "@/class/User"
import axios from "axios"
import { defineStore } from "pinia"
import router from "../router"
import api from "./utilites"

export const useAuthStore = defineStore("auth", {
  state: () => ({
    _user: {},
    _settings: {},
    _accessToken: null,
    _refreshToken: null,
    _isTokenRefreshing: false,
    _authenticated: false,
  }),
  getters: {
    authenticated() {
      return this._authenticated
    },
    user() {
      return new User(this._user)
    },
    accessToken() {
      return this._accessToken
    },
    setting() {
      return this._settings
    },
  },
  actions: {
    normalizeRedirectLocation(redirectLocation) {
      if (!redirectLocation) return null

      const trimmed = redirectLocation.trim()

      if (!trimmed) return null

      try {
        const parsedUrl = new URL(trimmed, window.location.origin)

        if (parsedUrl.origin === window.location.origin) {
          return `${parsedUrl.pathname}${parsedUrl.search}${parsedUrl.hash}` || '/'
        }
      } catch {
        // Ignore malformed URLs and fall back to a relative path.
      }

      return trimmed.startsWith('/') ? trimmed : `/${trimmed}`
    },

    login(payload) {
      api
        .post("/login", payload)
        .then(res => {
          this._authenticated = true
          this._accessToken = res.data.access_token
          this._refreshToken = res.data.refresh_token
          const redirectLocation = this.normalizeRedirectLocation(localStorage.getItem("redirect"))

          if (redirectLocation) {
            router.push(redirectLocation)
            window.localStorage.removeItem("redirect")
          } else {
            router.push({ path: "/" })
          }
        })        
    },

    refreshToken() {
      return new Promise((resolve, reject) => {
        this._isTokenRefreshing = true
        axios
          .post(`${import.meta.env.VITE_API_BASE_URL}/api/refresh`, {
            refresh_token: this._refreshToken,
            client_id: import.meta.env.VITE_CLIENT_ID,
            client_secret: import.meta.env.VITE_CLIENT_SECRET,
          })
          .then(response => {
            this._authenticated = true
            this._accessToken = response.data.access_token
            this._refreshToken = response.data.refresh_token
            resolve()
          })
          .catch(response => {
            this._authenticated = false
            this._accessToken = null
            this._refreshToken = null
            const currentPath = `${window.location.pathname}${window.location.search}${window.location.hash}`
            window.localStorage.setItem("redirect", currentPath)
            reject(response)
          })
          .finally(() => {
            this._isTokenRefreshing = false
          })
      })
    },

    async logout() {
      api
        .post("/logout", this.user)
        .then(res => {
          if (res.status == 200) {
            localStorage.removeItem("auth")
            this._authenticated = false
            this._accessToken = null
            this._refreshToken = null
            this._user = {}
            this._settings = {}
            router.push({ path: "/login" })
          }
        })        
    },

    setAuth(data) {
      if (data) {
        this._user = data
      } else {
        this._user = {}
      }
    },

    setSettings(data) {
      if (data) {
        data.map(e => {    
          this._settings[e.key] = e.value          
        })        
      }
    },    

    setRefreshing(value) {
      this._isTokenRefreshing = value
    },
  },

  persist: {
    storage: localStorage,
  },

  // persist: true,
})
