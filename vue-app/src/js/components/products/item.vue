<script>
import { mapGetters, mapActions } from 'vuex';

export default {

    props: [
        'id',
    ],
    data: _ => {
        return  {
            editable: false,
        };
    },
    computed: {
        ...mapGetters('products', [
            'getProduct'
        ]),
        product() {
            return this.getProduct(this.id);
        },
        title: {
            get() {
                return this.product.title;
            },
            set(value) {

                this.patchProduct({
                    id: this.id,
                    patch: [{ op: 'add', path: "/title", value }],
                });
            },
        },
        description: {
            get() {
                return this.product.description;
            },
            set(value) {

                this.patchProduct({
                    id: this.id,
                    patch: [{ op: 'add', path: "/description", value }],
                });
            },
        },
    },
    methods: {
        ...mapActions('products', [
            'patchProduct',
            'deleteProduct',
        ]),
        toggleEdit() {

            this.editable = !this.editable;
        },
        openDeletePopup() {

            this.$modal.show('dialog', {
                title: 'delete product',
                text: 'Are you sure about that?',
                buttons: [
                    { title: "Yes", handler: _ => { this.delete(); this.$modal.hide('dialog'); }},
                    { title: "No", handler: _ => { this.$modal.hide('dialog'); }},
                ],
            });
        },
        delete() {

            this.deleteProduct(this.id);
        },
    },
}

</script>

<template lang='pug'>

    .product
        input.product__title(v-model="title" :disabled="!editable")
        textarea.product__description(v-model="description" :disabled="!editable")
        button.product__button.product__button_delete(@click='toggleEdit()') {{ editable == true ? 'finish editing' : 'edit' }}
        button.product__button.product__button_delete(@click='openDeletePopup()') Delete
        button.product__button(@click="$router.push(`/products/${id}/products`)") Show products

</template>
