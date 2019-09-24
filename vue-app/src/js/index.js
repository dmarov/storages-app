import Vue from 'vue';
import App from './components/layout';
import store from './store';
import { mapActions } from 'vuex';
import VModal from 'vue-js-modal'
import VueRouter from 'vue-router';

import CategoriesRoute from './components/categories-route';
import CategoryProductsRoute from './components/category-products-route';
import ProductsRoute from './components/products-route';

import '../sass/index.scss';

Vue.use(VModal, { dynamic: true, injectModalsContainer: true });
Vue.use(VueRouter);

const el = document.querySelector("#app");

const routes = [
    { path: '/categories', component: CategoriesRoute },
    { path: '/categories/:page', component: CategoriesRoute },
    { path: '/categories/:id/products/:page', component: CategoryProductsRoute },
    { path: '/products', component: ProductsRoute },
    { path: '/products/:page', component: ProductsRoute },
    { path: '*', component: CategoriesRoute },
];

const router = new VueRouter({
    routes,
});

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
