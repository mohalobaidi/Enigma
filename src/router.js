import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/views/Home.vue'

Vue.use(Router)

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: true
      }
    }, {
      path: '/solve/:lang/:id',
      name: 'solve',
      meta: {
        requiresAuth: true
      },
      component: () => import('./views/Solve.vue')
    }
  ]
})

// router.beforeEach((to, from, next) => {
//   const username = store.getters.user.username || ''
//   if (username === '' && to.matched.some(record => record.meta.requiresAuth)) {
//     next({ name: 'login' })
//   } else {
//     next()
//   }
// })

export default router
