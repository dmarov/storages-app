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
        }
    },
}

</script>

<template lang='pug'>

    .category
        input.category__title(v-model="title" :disabled="!editable")
        input.category__description(v-model="description" :disabled="!editable")
        button.category__edit(@click='toggleEdit()') {{ editable == true ? 'end editing' : 'edit' }}

</template>
