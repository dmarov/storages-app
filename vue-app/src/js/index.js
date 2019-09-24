import Vue from 'vue';
import App from './components/layout';
import store from './store';
import { mapActions } from 'vuex';

import '../sass/index.scss';

const el = document.querySelector("#app");

new Vue({
    el,
    store,
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
