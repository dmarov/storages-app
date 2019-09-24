export default {

    init(context, params) {

        context.commit('init', params);
        context.dispatch('categories/init');
    },
};
