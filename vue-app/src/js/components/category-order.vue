<script>

import { mapActions } from 'vuex';

export default {

    data: _ => {

        return {
            title: '',
            description: '',
        };
    },
    methods: {
        ...mapActions('categories', [
            'appendCategory',
        ]),
        append() {

            this.appendCategory({
                title: this.title,
                description: this.description,
            });
        },
    },
};

</script>
<template lang="pug">
    .category-sort
</template>
