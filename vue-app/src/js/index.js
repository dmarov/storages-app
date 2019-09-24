import Vue from 'vue';
import App from './components/layout';
import store from './store';
import { mapActions } from 'vuex';
import VModal from 'vue-js-modal'

import '../sass/index.scss';

Vue.use(VModal, { dynamic: true, injectModalsContainer: true });

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
