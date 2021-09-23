import Vue from 'vue';
import App from './App.vue';
import loading from 'vuejs-loading-screen'

Vue.use(loading, {
    bg: '#41b883ad',
    icon: 'refresh',
    size: 6,
    icon_color: 'white',
})

new Vue({
    el: '#app',
    render: h => h(App)
});
