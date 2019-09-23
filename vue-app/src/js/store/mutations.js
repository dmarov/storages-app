export default {

    init(state, params) {

        if (!state.initialized) {

            state.params = params;
        }
    },
};
