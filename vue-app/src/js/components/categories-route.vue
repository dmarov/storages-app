<script>
import { mapGetters } from 'vuex';
import Noty from 'noty';
import authfetch from '../lib/authfetch';

export default {

    computed: {
        ...mapGetters([
            'getParam'
        ]),
    },
    methods: {
        async setPage(page) {

            let link = this.getParam('categories-link');
            let url = new URL(link, location.origin);
            url.searchParams.set('page', page - 1);

            try {
                let response = await authfetch(url);
                let result = await response.json();

                console.log(result);
            } catch(e) {

                if (e.name == "AuthError") {

                    new Noty({
                        text: e.message,
                        type: "error",
                    }).show();
                } else throw e;
            }
        },
    },
    created() {

        let page = this.$route.params.page ? this.$route.params.page : 1;
        this.setPage(page);
    },
    watch: {
        '$route' (to, from) {

            if (to.params.page !== from.params.page)
                this.setPage(to.params.page);
        },
    },
}

</script>

<template lang='pug'>

    .categories-content Categories

</template>
