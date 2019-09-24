import Vue from 'vue';
import App from './components/layout';
import store from './store';
import { mapActions } from 'vuex';
import VModal from 'vue-js-modal'
import VueRouter from 'vue-router';

import '../sass/index.scss';

Vue.use(VModal, { dynamic: true, injectModalsContainer: true });

const el = document.querySelector("#app");

const routes = [
    // { path: '/categories/:page', component: Categories },
    // { path: '/categories/:id/products/:page', component: CategoryProducts },
    // { path: '/products/:page', component: Products },
];

const router = new VueRouter({
    routes,
})

new Vue({
    el,
    store,
    router,
    methods: {
        ...mapActions([
            'init'
        ]),
    },
    created() {

        let params = el.dataset;

        this.init({
            'products-link': params.productsLink,
            'categories-link': params.categoriesLink,
        });
    },
    render: h => h(App),
});
