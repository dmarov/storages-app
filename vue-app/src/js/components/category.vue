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
        ...mapGetters('categories', [
            'getCategory'
        ]),
        category() {
            return this.getCategory(this.id);
        },
        title: {
            get() {
                return this.category.title;
            },
            set(value) {

                this.patchCategory({
                    id: this.id,
                    patch: [{ op: 'add', path: "/title", value }],
                });
            },
        },
        description: {
            get() {
                return this.category.description;
            },
            set(value) {

                this.patchCategory({
                    id: this.id,
                    patch: [{ op: 'add', path: "/description", value }],
                });
            },
        },
    },
    methods: {
        ...mapActions('categories', [
            'patchCategory',
        ]),
        toggleEdit() {

            this.editable = !this.editable;
        },
        openDeletePopup() {

            this.$modal.show('dialog', {
                title: 'delete category',
                text: 'Are you sure about that?',
                buttons: [
                    { title: "Yes", handler: this.deleteCategory },
                    { title: "No" },
                ],
            });
        },
        deleteCategory() {
        
            console.log('ok');
        },
    },
}

</script>

<template lang='pug'>

    .category
        input.category__title(v-model="title" :disabled="!editable")
        input.category__description(v-model="description" :disabled="!editable")
        button.category__button.category__button_delete(@click='toggleEdit()') {{ editable == true ? 'end editing' : 'edit' }}
        button.category__button.category__button_delete(@click='openDeletePopup()') Delete
        v-dialog

</template>
