<script>

import Menu from './menu';
import Toolbar from './toolbar';

export default {

    components: {
        'app-menu': Menu,
        'app-toolbar': Toolbar,
    },
};

</script>
<template lang="pug">

    .container
        app-toolbar
        app-menu
        .content
            router-view
</template>
