<script>
import { mapGetters, mapActions } from 'vuex';

export default {

    props: [
        'id',
    ],
    computed: {
        ...mapGetters('categories', [
            'getCategory'
        ]),
        category() {
            return this.getCategory(this.id);
        },
    },
}

</script>

<template lang='pug'>

    .category
        .category__title {{ category.title }}
        .category__description {{ category.description }}

</template>
