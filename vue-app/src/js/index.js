import Vue from 'vue';
import App from './components/layout';

const el = document.querySelector("#app");

new Vue({
    el,
    render: h => h(App),
});
