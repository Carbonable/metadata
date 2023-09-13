const NAME: felt252 = 'SDG01.svg';
#[starknet::contract]
mod Component {
    use array::ArrayTrait;
    use metadata::interfaces::component::IComponent;
    use metadata::components::configs::svg;

    #[storage]
    struct Storage {}

    #[external(v0)]
    impl ComponentImpl of IComponent<ContractState> {
        fn name(self: @ContractState) -> felt252 {
            super::NAME
        }

        fn render(self: @ContractState, args: Option<Span<felt252>>) -> Array<felt252> {
            let props: svg::Properties = svg::parse_properties(args);

            let mut data: Array<felt252> = Default::default();
            svg::add_header_helper(props, ref data);

            data.append(' id=\\"SDG1\\" xmlns=\\"http://w');
            data.append('ww.w3.org/2000/svg\\" viewBox=');
            data.append('\\"0 0 62 62\\"><rect fill=\\"#');
            data.append('ea1d2d\\" width=\\"62\\" height');
            data.append('=\\"62\\"/><g fill=\\"#fff\\"><');
            data.append('path d=\\"M5.46,7.83c-.11.06-.4');
            data.append('2.18-.94.37s-.68.23-.79.28V6.78');
            data.append('A10.81,10.81,0,0,0,5,6.19a3.93,');
            data.append('3.93,0,0,0,1-.73H7.75v12H5.46Z');
            data.append('\\"/><path d=\\"M12.78,5.45h.58');
            data.append('l1.11,2.61V5.45h.69V10h-.55L13.');
            data.append('49,7.3V10h-.71Z\\"/><path d=\\"');
            data.append('M16,9.71a1.75,1.75,0,0,1-.3-1.1');
            data.append('1V6.88a1.7,1.7,0,0,1,.3-1.1,1.2');
            data.append('6,1.26,0,0,1,1-.38,1.23,1.23,0,');
            data.append('0,1,1,.38,1.64,1.64,0,0,1,.31,1');
            data.append('.1V8.6A1.73,1.73,0,0,1,18,9.71a');
            data.append('1.2,1.2,0,0,1-1,.38A1.23,1.23,0');
            data.append(',0,1,16,9.71Zm1.4-.41a1.11,1.11');
            data.append(',0,0,0,.09-.51V6.69a1.14,1.14,0');
            data.append(',0,0-.09-.51.5.5,0,0,0-.76,0,1.');
            data.append('09,1.09,0,0,0-.09.5v2.1a1.11,1.');
            data.append('11,0,0,0,.09.51.49.49,0,0,0,.76');
            data.append(',0Z\\"/><path d=\\"M12.78,12.93');
            data.append('h1.34c.78,0,1.17.44,1.17,1.3a1.');
            data.append('1,1.1,0,0,1-1.23,1.25h-.45v2h-.');
            data.append('83Zm1.15,2a.58.58,0,0,0,.46-.15');
            data.append('.79.79,0,0,0,.12-.51,2.12,2.12,');
            data.append('0,0,0,0-.42.37.37,0,0,0-.17-.22');
            data.append('.71.71,0,0,0-.37-.07h-.32v1.37Z');
            data.append('\\"/><path d=\\"M16,17.19a1.69,');
            data.append('1.69,0,0,1-.31-1.11V14.36A1.69,');
            data.append('1.69,0,0,1,16,13.25a1.26,1.26,0');
            data.append(',0,1,1-.37,1.27,1.27,0,0,1,1,.3');
            data.append('7,1.75,1.75,0,0,1,.3,1.11v1.72A');
            data.append('1.73,1.73,0,0,1,18,17.19a1.19,1');
            data.append('.19,0,0,1-1,.38A1.21,1.21,0,0,1');
            data.append(',16,17.19Zm1.39-.41a1.11,1.11,0');
            data.append(',0,0,.09-.51V14.16a1.09,1.09,0,');
            data.append('0,0-.09-.5.39.39,0,0,0-.37-.17.');
            data.append('4.4,0,0,0-.38.17,1,1,0,0,0-.1.5');
            data.append('v2.11a1,1,0,0,0,.1.51.48.48,0,0');
            data.append(',0,.75,0Z\\"/><path d=\\"M18.67');
            data.append(',12.93h.73l.6,3.24.58-3.24h.75l');
            data.append('-.92,4.58h-.82Z\\"/><path d=\\"');
            data.append('M21.77,12.93h1.92v.59H22.6v1.32');
            data.append('h.86v.58H22.6v1.52h1.1v.57H21.7');
            data.append('7Z\\"/><path d=\\"M24.16,12.93h');
            data.append('1.1a1.72,1.72,0,0,1,1.08.28,1.1');
            data.append(',1.1,0,0,1,.36.94,1.64,1.64,0,0');
            data.append(',1-.13.71.79.79,0,0,1-.44.4l.64');
            data.append(',2.25h-.84l-.54-2.1H25v2.1h-.83');
            data.append('Zm1.1,2a.65.65,0,0,0,.5-.16.79.');
            data.append('79,0,0,0,.15-.54.81.81,0,0,0-.1');
            data.append('3-.52.59.59,0,0,0-.48-.17H25v1.');
            data.append('39Z\\"/><path d=\\"M27.75,13.55');
            data.append('H27v-.62h2.34v.62h-.75v4h-.83Z');
            data.append('\\"/><path d=\\"M30.31,15.76l-.');
            data.append('93-2.83h.78l.57,1.82.53-1.82H32');
            data.append('l-.91,2.83v1.75h-.8Z\\"/><path');
            data.append(' d=\\"M48.36,30a1.75,1.75,0,1,1');
            data.append(',1.75,1.74A1.75,1.75,0,0,1,48.3');
            data.append('6,30\\"/><path d=\\"M52.15,32.3');
            data.append('8a2.32,2.32,0,0,1,2.11,2.32v4.8');
            data.append('4a.68.68,0,0,1-1.35,0V35.38c0-.');
            data.append('16,0-.37-.33-.37s-.24.21-.25.34');
            data.append('V47.82a1,1,0,0,1-1.95,0V40.64a.');
            data.append('26.26,0,0,0-.27-.29h0a.28.28,0,');
            data.append('0,0-.29.29v7.18a1,1,0,0,1-1.94,');
            data.append('0V35.35c0-.13-.05-.34-.24-.34s-');
            data.append('.33.21-.33.37v4.16a.68.68,0,0,1');
            data.append('-1.36,0V34.7a2.32,2.32,0,0,1,2.');
            data.append('12-2.32h4.08\\"/><path d=\\"M38');
            data.append(',30.87a1.65,1.65,0,1,0-1.65,1.6');
            data.append('6A1.65,1.65,0,0,0,38,30.87\\"/>');
            data.append('<path d=\\"M33,34.62,31.61,39.1');
            data.append('s-.24.82.45,1,.91-.6.91-.6l1.11');
            data.append('-3.73s.06-.29.27-.23.14.37.14.3');
            data.append('7l-1.93,7h1.79v5a.86.86,0,0,0,1');
            data.append('.72,0v-5h.49v5a.87.87,0,0,0,1.7');
            data.append('3,0v-5h1.79l-1.93-7s-.08-.3.14-');
            data.append('.37.27.23.27.23l1.11,3.73s.21.8');
            data.append('1.91.6.45-1,.45-1l-1.38-4.48s-.');
            data.append('49-1.29-1.58-1.29h-3.5c-1.09,0-');
            data.append('1.58,1.29-1.58,1.29\\"/><path d');
            data.append('=\\"M28.07,30.87a1.66,1.66,0,1,');
            data.append('0-1.66,1.66,1.65,1.65,0,0,0,1.6');
            data.append('6-1.66\\"/><path d=\\"M23.08,34');
            data.append('.62,21.71,39.1s-.25.82.45,1,.9-');
            data.append('.6.9-.6l1.11-3.73s.06-.29.27-.2');
            data.append('3.14.37.14.37l-1.93,7h1.79v5a.8');
            data.append('7.87,0,0,0,1.73,0v-5h.49v5a.86.');
            data.append('86,0,0,0,1.72,0v-5h1.8l-1.93-7s');
            data.append('-.08-.3.13-.37.28.23.28.23l1.11');
            data.append(',3.73s.21.81.9.6.45-1,.45-1l-1.');
            data.append('38-4.48s-.49-1.29-1.57-1.29H24.');
            data.append('66c-1.09,0-1.58,1.29-1.58,1.29');
            data.append('\\"/><path d=\\"M43.53,40.13a1.');
            data.append('38,1.38,0,1,0-1.38-1.38,1.37,1.');
            data.append('37,0,0,0,1.38,1.38\\"/><path d=');
            data.append('\\"M40.23,44.41a.47.47,0,0,0,.2');
            data.append('.65.46.46,0,0,0,.59-.19l.75-2.3');
            data.append('9s.13-.16.13,0V48.1h0a.71.71,0,');
            data.append('1,0,1.41,0V45.89s0-.32.21-.32.2');
            data.append('2.32.22.32V48.1a.7.7,0,0,0,.7.7');
            data.append('1.71.71,0,0,0,.71-.71V42.48c0-.');
            data.append('16.09,0,.09,0l.59,1.63a3.73,3.7');
            data.append('3,0,0,0,.33.76.51.51,0,0,0,.68-');
            data.append('.28.52.52,0,0,0-.05-.5h0s-.88-2');
            data.append('.16-1-2.45c-.31-.91-.87-.9-1.42');
            data.append('-.92s-.87,0-.87,0-.34,0-1.06,0-');
            data.append('1,.39-1.74,2.43c-.11.29-.49,1.2');
            data.append('4-.5,1.3Z\\"/><path d=\\"M13.3,');
            data.append('30a1.75,1.75,0,1,0-1.75,1.74A1.');
            data.append('75,1.75,0,0,0,13.3,30\\"/><path');
            data.append(' d=\\"M9.51,32.38A2.32,2.32,0,0');
            data.append(',0,7.39,34.7v4.84a.68.68,0,0,0,');
            data.append('1.36,0V35.38c0-.16,0-.37.33-.37');
            data.append('s.24.21.25.34V47.82a1,1,0,1,0,1');
            data.append('.94,0V40.64a.27.27,0,0,1,.28-.2');
            data.append('9h0a.27.27,0,0,1,.28.29v7.18a1,');
            data.append('1,0,1,0,1.94,0V35.35c0-.13.05-.');
            data.append('34.25-.34s.33.21.33.37v4.16a.68');
            data.append('.68,0,0,0,1.35,0V34.7a2.32,2.32');
            data.append(',0,0,0-2.11-2.32H9.51\\"/><path');
            data.append(' d=\\"M6.43,48.83H6.37a.37.37,0');
            data.append(',0,1-.3-.44l1.55-8.22a.36.36,0,');
            data.append('0,1,.43-.29.36.36,0,0,1,.3.43L6');
            data.append('.8,48.53A.37.37,0,0,1,6.43,48.8');
            data.append('3Z\\"/><path d=\\"M16.53,39.41a');
            data.append('.5.5,0,0,0-.92.26.9.9,0,0,0,.05');
            data.append('.22L17,42.41a.83.83,0,0,1,.09.3');
            data.append('3v5.39h0a.68.68,0,0,0,1.36,0V46');
            data.append('s0-.3.2-.3.21.3.21.3v2.13a.68.6');
            data.append('8,0,1,0,1.35,0V42.74a.83.83,0,0');
            data.append(',1,.09-.33l1.28-2.32a2.33,2.33,');
            data.append('0,0,0,.16-.42.5.5,0,0,0-.93-.26');
            data.append('h0s-.69,1.17-.9,1.39a.57.57,0,0');
            data.append(',1-.42.2H17.86a.6.6,0,0,1-.43-.');
            data.append('2c-.21-.22-.85-1.36-.89-1.39Z\\');
            data.append('"/><path d=\\"M18.69,40.13a1.38');
            data.append(',1.38,0,1,0-1.38-1.38,1.38,1.38');
            data.append(',0,0,0,1.38,1.38\\"/><polygon p');
            data.append('oints=\\"18.69 42.06 20.25 43.2');
            data.append(' 20.99 45.92 18.69 45.92 16.4 4');
            data.append('5.92 17.14 43.2 18.69 42.06\\"/');
            data.append('></g></svg>');

            data
        }
    }
}

#[cfg(test)]
mod test {
    use array::{ArrayTrait, SpanTrait};
    use debug::PrintTrait;
    use traits::Into;

    use test::test_utils::assert_eq;

    use super::Component;
    use metadata::components::configs::svg;

    #[test]
    #[available_gas(15_000)]
    fn test_component_name() {
        let data: Span<felt252> = Component::__external::name(Default::default().span());
        let name: felt252 = *data[0];
        assert_eq(@name, @super::NAME, 'Couldn\'t get name');
    }

    #[test]
    #[available_gas(1043000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @149_u32, 'Couldn\'t get data');
        let mut arr: Array<felt252> = ArrayTrait::new();
    }
}
