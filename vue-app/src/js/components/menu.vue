<script>

export default {

};

</script>
<template lang='pug'>

    nav.menu
        ul.menu__items
            li.menu__item.container__el_pointable
                router-link.menu__link.container__el_nolink(to="/categories") Categories
            li.menu__item.container__el_pointable
                router-link.menu__link.container__el_nolink(to="/products") Products

</template>
