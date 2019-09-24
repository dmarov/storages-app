<script>

import Menu from './menu';
import Content from './content';
import Toolbar from './toolbar';

export default {

    components: {
        'app-menu': Menu,
        'app-content': Content,
        'app-toolbar': Toolbar,
    },
};

</script>
<template lang="pug">

    .container
        app-toolbar
        app-menu
        app-content
</template>
