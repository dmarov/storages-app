<script>
import { mapGetters, mapActions } from 'vuex';
import Noty from 'noty';
import Category from './category';

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
    components: {
        'app-category': Category,
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
        .categories(v-if="categories")
            app-category(v-for="category in categories._embedded.items" :key="category.id" :id="category.id")

</template>
