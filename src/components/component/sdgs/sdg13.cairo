const NAME: felt252 = 'SDG13.svg';

#[starknet::contract]
mod Component {
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

            data.append(' id=\\"SDG13\\" xmlns=\\"http://');
            data.append('www.w3.org/2000/svg\\" viewBox=');
            data.append('\\"0 0 62.11 62.11\\"><rect fil');
            data.append('l=\\"%2348773c\\" width=\\"62.11');
            data.append('\\" height=\\"62.11\\"/><g fill');
            data.append('=\\"%23fff\\"><path d=\\"M5.5,7.7');
            data.append('4c-.11.06-.42.18-.94.37l-.77.27');
            data.append('V6.7A9,9,0,0,0,5,6.12,4,4,0,0,0');
            data.append(',6,5.4H7.76V17.24H5.5Z\\"/><pat');
            data.append('h d=\\"M9.68,16.51a4.08,4.08,0,');
            data.append('0,1-.75-2.64v-.41h2.26v.39a3.2,');
            data.append('3.2,0,0,0,.21,1.3.77.77,0,0,0,.');
            data.append('75.4.72.72,0,0,0,.72-.4,3.24,3.');
            data.append('24,0,0,0,.19-1.31,2.86,2.86,0,0');
            data.append(',0-.28-1.41,1.14,1.14,0,0,0-1-.');
            data.append('48h-.41V10.29h.36a1.19,1.19,0,0');
            data.append(',0,1-.41A2.36,2.36,0,0,0,13,8.5');
            data.append('3a2.2,2.2,0,0,0-.22-1.13.79.79,');
            data.append('0,0,0-.72-.4.71.71,0,0,0-.7.39,');
            data.append('2.75,2.75,0,0,0-.2,1.17v.53H8.9');
            data.append('3v-.6a3.26,3.26,0,0,1,.83-2.4,3');
            data.append('.09,3.09,0,0,1,2.33-.85,3.22,3.');
            data.append('22,0,0,1,2.37.82,3.15,3.15,0,0,');
            data.append('1,.83,2.35,3.23,3.23,0,0,1-.42,');
            data.append('1.72,1.84,1.84,0,0,1-1.08.87q1.');
            data.append('5.55,1.5,2.79a4.23,4.23,0,0,1-.');
            data.append('76,2.69,2.88,2.88,0,0,1-2.41,1A');
            data.append('2.92,2.92,0,0,1,9.68,16.51Z\\"/');
            data.append('><path d=\\"M21.24,10a1.33,1.33');
            data.append(',0,0,1-.78-.19,1,1,0,0,1-.39-.5');
            data.append('4,2.39,2.39,0,0,1-.07-.8V6.86a2');
            data.append('.48,2.48,0,0,1,.11-.81.92.92,0,');
            data.append('0,1,.39-.52,1.33,1.33,0,0,1,.78');
            data.append('-.19A1.49,1.49,0,0,1,22,5.5a.93');
            data.append('.93,0,0,1,.37.46,1.79,1.79,0,0,');
            data.append('1,.12.69V7h-.8V6.26a.46.46,0,0,');
            data.append('0-.1-.25.4.4,0,0,0-.3-.09A.44.4');
            data.append('4,0,0,0,21,6a.46.46,0,0,0-.13.2');
            data.append('7,2.29,2.29,0,0,0,0,.37v2a2.67,');
            data.append('2.67,0,0,0,0,.4.45.45,0,0,0,.14');
            data.append('.24.43.43,0,0,0,.29.08.39.39,0,');
            data.append('0,0,.29-.09A.54.54,0,0,0,21.65,');
            data.append('9V8.24h.8v.37a2.15,2.15,0,0,1-.');
            data.append('11.71,1,1,0,0,1-.37.49A1.42,1.4');
            data.append('2,0,0,1,21.24,10Z\\"/><path d=');
            data.append('\\"M22.87,9.92V5.39h.83v4h1.1V1');
            data.append('0Z\\"/><path d=\\"M25.06,9.92V5');
            data.append('.39h.81V9.92Z\\"/><path d=\\"M2');
            data.append('6.39,9.92l.08-4.53h.86L28,8.53l');
            data.append('.67-3.14h.83l.08,4.53H29L28.9,6');
            data.append('.77l-.64,3.15h-.5l-.65-3.16L27,');
            data.append('9.92Z\\"/><path d=\\"M29.83,9.9');
            data.append('2l.9-4.53h.89l.9,4.53h-.76l-.18');
            data.append('-1h-.79l-.19,1Zm1-1.57h.62l-.31');
            data.append('-1.9Z\\"/><path d=\\"M33.05,9.9');
            data.append('2V6h-.72V5.39h2.25V6h-.71V9.92Z');
            data.append('\\"/><path d=\\"M34.83,9.92V5.3');
            data.append('9h1.9V6H35.66V7.28h.84v.57h-.84');
            data.append('v1.5h1.08v.57Z\\"/><path d=\\"M');
            data.append('19.79,17.32l.91-4.53h.88l.91,4.');
            data.append('53h-.77l-.18-1.05h-.79l-.18,1.0');
            data.append('5Zm1.05-1.57h.61l-.3-1.9Z\\"/><');
            data.append('path d=\\"M23.94,17.38a1.42,1.4');
            data.append('2,0,0,1-.78-.2,1,1,0,0,1-.39-.5');
            data.append('3,2.3,2.3,0,0,1-.11-.78V14.25a2');
            data.append('.42,2.42,0,0,1,.11-.8,1,1,0,0,1');
            data.append(',.39-.53,1.52,1.52,0,0,1,.78-.1');
            data.append('8,1.46,1.46,0,0,1,.74.16.87.87,');
            data.append('0,0,1,.37.45,2,2,0,0,1,.12.69v.');
            data.append('38h-.8v-.77a.46.46,0,0,0-.1-.25');
            data.append('.4.4,0,0,0-.3-.09.45.45,0,0,0-.');
            data.append('31.1.43.43,0,0,0-.13.26,2.29,2.');
            data.append('29,0,0,0,0,.37v2a2.81,2.81,0,0,');
            data.append('0,0,.41.58.58,0,0,0,.14.24.51.5');
            data.append('1,0,0,0,.29.08.38.38,0,0,0,.29-');
            data.append('.1.47.47,0,0,0,.11-.26v-.77h.8V');
            data.append('16a2.21,2.21,0,0,1-.11.72.94.94');
            data.append(',0,0,1-.37.48A1.36,1.36,0,0,1,2');
            data.append('3.94,17.38Z\\"/><path d=\\"M26,');
            data.append('17.32V13.4h-.7v-.61h2.26v.61h-.');
            data.append('71v3.92Z\\"/><path d=\\"M27.83,');
            data.append('17.32V12.79h.82v4.53Z\\"/><path');
            data.append(' d=\\"M30.41,17.38a1.46,1.46,0,');
            data.append('0,1-.77-.18,1,1,0,0,1-.41-.51,2');
            data.append('.43,2.43,0,0,1-.12-.8V14.2a2.11');
            data.append(',2.11,0,0,1,.12-.79,1,1,0,0,1,.');
            data.append('41-.5,1.83,1.83,0,0,1,1.54,0,1,');
            data.append('1,0,0,1,.41.5,2.34,2.34,0,0,1,.');
            data.append('13.79v1.7a2.28,2.28,0,0,1-.13.7');
            data.append('8,1,1,0,0,1-.41.52A1.46,1.46,0,');
            data.append('0,1,30.41,17.38Zm0-.61a.4.4,0,0');
            data.append(',0,.3-.09.38.38,0,0,0,.13-.25,1');
            data.append(',1,0,0,0,0-.34V14a1,1,0,0,0,0-.');
            data.append('34.38.38,0,0,0-.13-.24.4.4,0,0,');
            data.append('0-.3-.09.46.46,0,0,0-.3.09.47.4');
            data.append('7,0,0,0-.13.24A1.93,1.93,0,0,0,');
            data.append('30,14v2.08a1,1,0,0,0,0,.34.38.3');
            data.append('8,0,0,0,.13.25A.41.41,0,0,0,30.');
            data.append('41,16.77Z\\"/><path d=\\"M32.16');
            data.append(',17.32V12.79h.57l1.11,2.58V12.7');
            data.append('9h.68v4.53H34l-1.11-2.71v2.71Z');
            data.append('\\"/><path d=\\"M54.41,39a28.53');
            data.append(',28.53,0,0,0-45.8-.06l-.18.25.1');
            data.append('8.26a28.53,28.53,0,0,0,45.8.06l');
            data.append('.18-.25L54.41,39m-30.6-5.73c.12');
            data.append('-.18.54-.71.59-.77a.66.66,0,0,1');
            data.append(',.46-.19c.15,0,.34,0,.37.16a1.4');
            data.append('2,1.42,0,0,1-.13.61,1.58,1.58,0');
            data.append(',0,1-1,.46c-.23,0-.32-.21-.27-.');
            data.append('27m-.5,1,.05-.06a1.31,1.31,0,0,');
            data.append('1,.76-.28c.24,0,.56.08.6.24s-.6');
            data.append('.45-.72.56c-.33.31-.85.93-1.16,');
            data.append('1a.36.36,0,0,1-.25,0,9.11,9.11,');
            data.append('0,0,1,.72-1.43m5.16,10.62a2.87,');
            data.append('2.87,0,0,1-.59,1.23,2,2,0,0,1-1');
            data.append('.32.5c-.44,0-.49-1.2-.49-1.8,0-');
            data.append('.21-.3.41-.45-.85-.1-.8-.61.09-');
            data.append('.65-.45s-.29-.42-.56-.76-.6,0-1');
            data.append(',.2-.22.26-.75.09h0a9.58,9.58,0');
            data.append(',0,1-.76-3.74,6.84,6.84,0,0,1,0');
            data.append('-1l.06-.08c.51-.61.5-.75.5-.75l');
            data.append('.57-.19a10.59,10.59,0,0,1,1.57.');
            data.append('39c.56.21,1.44.69,1.95.48s.66-.');
            data.append('35.63-.66-.35-.48-.72-.22c-.13.');
            data.append('1-.42-.58-.65-.55s.28.8.09.83-.');
            data.append('58-.79-.65-.93-.36-.46-.63-.21c');
            data.append('-.57.54-1.49.5-1.68.64-.56.42-.');
            data.append('71-.14-.7-.48a.29.29,0,0,1,.07-');
            data.append('.23,1.15,1.15,0,0,1,1.08-.12c.2');
            data.append('4.17.42,0,.52-.14a.33.33,0,0,0,');
            data.append('0-.4c-.06-.13.13-.23.26-.26A7.8');
            data.append('5,7.85,0,0,0,25,35a2.42,2.42,0,');
            data.append('0,1,1.46,0,.79.79,0,0,0,1-.19,2');
            data.append('.31,2.31,0,0,1,.7-.58c.14-.07-.');
            data.append('34-.52-.74,0s-.6.53-.79.53-1.3-');
            data.append('.28-1.43-.63.34-.61.76-.81A9.5,');
            data.append('9.5,0,0,1,27.68,33c.58-.13,1.33');
            data.append('-.42,1.7-.17s-1.57.69-.93,1c.23');
            data.append('.12,1.25-.59,1.61-.77.83-.43-.8');
            data.append('1-.57-.59-1.44s-2-.6-3.12-.52A9');
            data.append('.63,9.63,0,0,1,40.89,37a1.62,1.');
            data.append('62,0,0,1,0,.44.62.62,0,0,1-.8.3');
            data.append('6.6.6,0,0,1-.32-.27c-.1-.14-.51');
            data.append('-.53-.5.14s.65.73,0,1.13a2.59,2');
            data.append('.59,0,0,1-1,.41,1.31,1.31,0,0,0');
            data.append('-.5,1.15c.07.37.95,1.37.3,1.33a');
            data.append('3.74,3.74,0,0,1-1.49-1.3c-.2-.5');
            data.append('4-.42-1.06-.58-1.46a.58.58,0,0,');
            data.append('0-.72-.37.64.64,0,0,0-.18.1c-.3');
            data.append('5.24.09.47-.15,1s-.43,1-.79.54c');
            data.append('-.94-1.08-2.3-.55-2.52-1.75-.11');
            data.append('-.65-.67-.59-1.14-1s-.73-.56-.8');
            data.append('1-.3,1.47,1.46,1.58,1.77c.16.47');
            data.append('-.46.88-.92,1s-.66-.26-1.1-.73-');
            data.append('.65-.8-.68-.43a2.15,2.15,0,0,0,');
            data.append('.88,1.59c.39.25.83.36.7.76s0,.1');
            data.append('8-.44.61a1.17,1.17,0,0,0-.49,1.');
            data.append('17A4.2,4.2,0,0,1,29,44c-.09.5-.');
            data.append('31.07-.5.8M38.8,41c.33,0,.81.43');
            data.append('.62.6a.84.84,0,0,1-.91-.09c-.25');
            data.append('-.18.15-.5.29-.51m-.4-.29c-.11,');
            data.append('0-.2-.14-.28-.38s.12-.37.32-.27');
            data.append('a.9.9,0,0,1,.45.55c0,.16-.39.14');
            data.append('-.49.1m-4.25,0a.88.88,0,0,1-.92');
            data.append('-.08c-.25-.19.15-.5.29-.51.33,0');
            data.append(',.81.42.63.59m-3.94,1.91c-.13.2');
            data.append('2-.5,1.84-.74,1.65s.1-1.88.17-2');
            data.append('c.38-.7,1.21-.66.57.36m1.3,6.28');
            data.append('a9.53,9.53,0,0,1-2.7-.39.4.4,0,');
            data.append('0,1-.12-.47,2.17,2.17,0,0,1,1.8');
            data.append('9-1.15c1.56-.15,3.61,1,3.94.83s');
            data.append('1-1,1.95-1a1.6,1.6,0,0,1,.88.22');
            data.append(',9.57,9.57,0,0,1-5.84,2m6.8-2.8');
            data.append('A.89.89,0,0,1,38,46c-.52-.27-.4');
            data.append('6.16-.72.07s.3-.7-.48-.19-.57-.');
            data.append('08-.9-.94a1.76,1.76,0,0,1,1-2.0');
            data.append('6,10.71,10.71,0,0,1,1.75-.45c1.');
            data.append('15-.29,1.4-1,1.61-.56,0,.08.08.');
            data.append('15.11.22a1.71,1.71,0,0,1,.15.63');
            data.append(',9.57,9.57,0,0,1-2.21,3.39M41,4');
            data.append('1.21c-.26-.07-1.34-1.57-.48-2.5');
            data.append('5.14-.16-.29-.64-.17-.65a.77.77');
            data.append(',0,0,1,.84.67v.56a10.36,10.36,0');
            data.append(',0,1-.2,2\\"/></g></svg>');

            data
        }
    }
}

#[cfg(test)]
mod test {
    use debug::PrintTrait;

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
    #[available_gas(1302000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @186_u32, 'Couldn\'t get data');
    }
}
