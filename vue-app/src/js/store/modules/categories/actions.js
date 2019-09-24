


export default {

    async init(context) {

        context.dispatch('setCategories');
    },
    async setCategories(context) {

        let categoriesLink = context.rootGetters.getParam('categories-link');

    }
};
