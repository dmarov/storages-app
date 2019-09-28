<script>

import { mapActions } from 'vuex';

export default {

    props: [
        'cid',
    ],
    data: _ => {

        return {
            title: '',
            description: '',
            price: 0,
            count: 0,
            imageUrl: "",
        };
    },
    methods: {
        ...mapActions('category-products', [
            'appendProduct',
        ]),
        append() {

            this.appendProduct({
                title: this.title,
                categoryId: this.cid,
                description: this.description,
                price: parseFloat(this.price),
                count: parseInt(this.count),
            });
        },
    },
};

</script>
<template lang="pug">
    .new-product
        input.new-product__title(v-model="title")
        textarea.new-product__description(v-model="description")
        input.new-product__price(v-model="price")
        input.new-product__count(v-model="count")
        input.new-product__count(v-model="imageUrl")
        button.new-product__button(@click="append()") Create
</template>
