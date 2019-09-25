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
    },
    async patchCategory(context, { id, patch }) {

        let category = context.getters.getCategory(id);
        let link = category._links.self.href;

        let options = {
            method: 'PATCH',
            headers: new Headers({
                "content-type": "application/json-patch+json",
            }),
            body: JSON.stringify(patch),
        };

        try {

            let response = await authfetch(link, options);

            if (response.ok)
                context.commit('patchCategory', { id, patch });

        } catch(e) {

            if (e.name == "AuthError") {

                new Noty({
                    text: e.message,
                    type: "error",
                }).show();

            } else throw e;
        }
    },
};
