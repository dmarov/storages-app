export default {

    init(state, params) {

        if (!state.initialized) {

            state.initialized = true;
            state.params = params;
        }
    },
};
