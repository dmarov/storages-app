<script>
import { mapGetters, mapActions } from 'vuex';
import Noty from 'noty';

export default {

    computed: {
        ...mapGetters([
            'getParam'
        ]),
        ...mapGetters('categories', [
            'getCategories'
        ]),
        categories() {
            return this.getCategories();
        },
    },
    methods: {
        ...mapActions('categories', [
            'setCategoriesPage',
        ]),
        async setPage(page) {

            this.setCategoriesPage(page);

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
        .categories
            .category(v-for="category in categories" :key="category.id") {{ category.title }}

</template>
