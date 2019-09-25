import authfetch from '../../../lib/authfetch';

export default {

    async setCategoriesPage(context, page) {

        let link = context.rootGetters.getParam('categories-link');
        let url = new URL(link, location.origin);
        url.searchParams.set('page', page - 1);

        try {

            let response = await authfetch(url);
            let result = await response.json();
            context.commit('setCategories', result);

        } catch(e) {

            if (e.name == "AuthError") {

                new Noty({
                    text: e.message,
                    type: "error",
                }).show();

            } else throw e;
        }
    }
};
