const NAME: felt252 = 'SDG08.svg';

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

            data.append(' id=\\"SDG8\\" xmlns=\\"http://w');
            data.append('ww.w3.org/2000/svg\\" viewBox=');
            data.append('\\"0 0 62.23 62.23\\"><rect fil');
            data.append('l=\\"#8f1838\\" width=\\"62.23');
            data.append('\\" height=\\"62.23\\"/><g fill');
            data.append('=\\"#fff\\"><path d=\\"M4.87,15');
            data.append('.13a4,4,0,0,1,.35-1.73,2.27,2.2');
            data.append('7,0,0,1,1-1.08,3,3,0,0,1-.88-1.');
            data.append('07,3.58,3.58,0,0,1-.33-1.61,3.1');
            data.append('9,3.19,0,0,1,.77-2.28,3,3,0,0,1');
            data.append(',2.23-.81,2.88,2.88,0,0,1,2.21.');
            data.append('8A3.14,3.14,0,0,1,11,9.59a3.77,');
            data.append('3.77,0,0,1-.32,1.67,2.67,2.67,0');
            data.append(',0,1-.86,1.06,2.26,2.26,0,0,1,1');
            data.append(',1.11,4.35,4.35,0,0,1,.35,1.8,3');
            data.append('.93,3.93,0,0,1-.76,2.58,3,3,0,0');
            data.append(',1-2.42.92Q4.87,18.73,4.87,15.1');
            data.append('3Zm4,1.4A3.8,3.8,0,0,0,9,15.22a');
            data.append('4,4,0,0,0-.2-1.39.75.75,0,0,0-.');
            data.append('77-.52.76.76,0,0,0-.77.52,4.05,');
            data.append('4.05,0,0,0-.2,1.39,3.8,3.8,0,0,');
            data.append('0,.2,1.31.75.75,0,0,0,.77.52A.7');
            data.append('5.75,0,0,0,8.82,16.53Zm.07-6.89');
            data.append('a2.09,2.09,0,0,0-.21-1,.68.68,0');
            data.append(',0,0-.63-.38.7.7,0,0,0-.64.38,2');
            data.append(',2,0,0,0-.22,1c0,1.22.28,1.83.8');
            data.append('6,1.83S8.89,10.86,8.89,9.64Z\\"');
            data.append('/><path d=\\"M15.69,6.68h1.07a2');
            data.append(',2,0,0,1,.86.15.84.84,0,0,1,.44');
            data.append('.45,2.07,2.07,0,0,1,.14.81V9.75');
            data.append('a2.14,2.14,0,0,1-.14.83.9.9,0,0');
            data.append(',1-.44.48,1.75,1.75,0,0,1-.83.1');
            data.append('6h-1.1Zm1.08,4a.66.66,0,0,0,.39');
            data.append('-.09.4.4,0,0,0,.16-.27,2.89,2.8');
            data.append('9,0,0,0,0-.51V8a2.43,2.43,0,0,0');
            data.append(',0-.46.37.37,0,0,0-.17-.23.76.7');
            data.append('6,0,0,0-.39-.08h-.25v3.37Z\\"/>');
            data.append('<path d=\\"M18.66,6.68h1.9v.59H');
            data.append('19.48v1.3h.85v.58h-.85v1.5h1.1v');
            data.append('.57H18.66Z\\"/><path d=\\"M21.1');
            data.append('3,10.89a1.91,1.91,0,0,1-.29-1.1');
            data.append('2V8.15A1.88,1.88,0,0,1,21.13,7a');
            data.append('1.17,1.17,0,0,1,1-.39,1.16,1.16');
            data.append(',0,0,1,.95.34,1.46,1.46,0,0,1,.');
            data.append('28,1v.38h-.8V7.93a2,2,0,0,0,0-.');
            data.append('38.38.38,0,0,0-.11-.23.48.48,0,');
            data.append('0,0-.29-.08.4.4,0,0,0-.44.34,2.');
            data.append('1,2.1,0,0,0,0,.4v2a1.24,1.24,0,');
            data.append('0,0,.1.56.4.4,0,0,0,.37.17.38.3');
            data.append('8,0,0,0,.28-.09.46.46,0,0,0,.12');
            data.append('-.24,2.18,2.18,0,0,0,0-.39V9.54');
            data.append('h.8V9.9a1.61,1.61,0,0,1-.28,1,1');
            data.append('.12,1.12,0,0,1-.95.36A1.18,1.18');
            data.append(',0,0,1,21.13,10.89Z\\"/><path d');
            data.append('=\\"M23.79,6.68h1.9v.59H24.61v1');
            data.append('.3h.86v.58h-.86v1.5h1.1v.57H23.');
            data.append('79Z\\"/><path d=\\"M26,6.68h.58');
            data.append('l1.1,2.59V6.68h.69v4.54h-.55L26');
            data.append('.75,8.51v2.71H26Z\\"/><path d=');
            data.append('\\"M29.39,7.29h-.75V6.68H31v.61');
            data.append('h-.75v3.93h-.82Z\\"/><path d=\\');
            data.append('"M32.23,6.68h.69l.38,2.94.47-2.');
            data.append('93h.56l.48,2.93.37-2.94h.69l-.6');
            data.append('4,4.54h-.67l-.5-3-.5,3h-.69Z\\"');
            data.append('/><path d=\\"M36.44,10.9a1.74,1');
            data.append('.74,0,0,1-.3-1.1V8.09A1.71,1.71');
            data.append(',0,0,1,36.44,7a1.26,1.26,0,0,1,');
            data.append('1-.37,1.23,1.23,0,0,1,1,.37,1.6');
            data.append('5,1.65,0,0,1,.31,1.09V9.8a1.74,');
            data.append('1.74,0,0,1-.31,1.1,1.22,1.22,0,');
            data.append('0,1-1,.38A1.2,1.2,0,0,1,36.44,1');
            data.append('0.9Zm1.38-.4a1.15,1.15,0,0,0,.1');
            data.append('-.51V7.9a.92.92,0,0,0-.1-.49c-.');
            data.append('06-.12-.18-.17-.37-.17s-.31,0-.');
            data.append('37.17a.94.94,0,0,0-.1.49V10a1,1');
            data.append(',0,0,0,.1.51.38.38,0,0,0,.37.17');
            data.append('A.39.39,0,0,0,37.82,10.5Z\\"/><');
            data.append('path d=\\"M39.22,6.68h1.09A1.74');
            data.append(',1.74,0,0,1,41.38,7a1.12,1.12,0');
            data.append(',0,1,.36.94,1.75,1.75,0,0,1-.13');
            data.append('.7.75.75,0,0,1-.43.39l.63,2.24H');
            data.append('41l-.54-2.08H40v2.08h-.82Zm1.09');
            data.append(',2a.66.66,0,0,0,.5-.17A.75.75,0');
            data.append(',0,0,41,7.93a.88.88,0,0,0-.13-.');
            data.append('52.59.59,0,0,0-.48-.16H40V8.63Z');
            data.append('\\"/><path d=\\"M42.22,6.68H43v');
            data.append('2l.9-2h.79l-.87,2,1,2.52H44l-.7');
            data.append('6-2.06L43,9.5v1.72h-.82Z\\"/><p');
            data.append('ath d=\\"M46.94,6.68h.89l.91,4.');
            data.append('54H48l-.18-1.05H47l-.18,1.05H46');
            data.append('Zm.76,3-.31-1.91-.31,1.91Z\\"/>');
            data.append('<path d=\\"M49,6.68h.58l1.11,2.');
            data.append('59V6.68h.68v4.54h-.55L49.75,8.5');
            data.append('1v2.71H49Z\\"/><path d=\\"M52,6');
            data.append('.68H53a2,2,0,0,1,.86.15.9.9,0,0');
            data.append(',1,.45.45,2.08,2.08,0,0,1,.13.8');
            data.append('1V9.75a2.16,2.16,0,0,1-.13.83,1');
            data.append(',1,0,0,1-.44.48,1.78,1.78,0,0,1');
            data.append('-.83.16H52Zm1.08,4a.67.67,0,0,0');
            data.append(',.4-.09.49.49,0,0,0,.16-.27,3.1');
            data.append('3,3.13,0,0,0,0-.51V8a1.81,1.81,');
            data.append('0,0,0,0-.46.33.33,0,0,0-.16-.23');
            data.append('.83.83,0,0,0-.4-.08h-.24v3.37Z');
            data.append('\\"/><path d=\\"M15.69,14.09h1.');
            data.append('9v.59H16.51V16h.85v.58h-.85v1.5');
            data.append('H17.6v.57H15.69Z\\"/><path d=\\');
            data.append('"M18.19,18.3a1.91,1.91,0,0,1-.2');
            data.append('9-1.12V15.56a1.88,1.88,0,0,1,.2');
            data.append('9-1.13,1.17,1.17,0,0,1,1-.39,1.');
            data.append('16,1.16,0,0,1,.95.34,1.46,1.46,');
            data.append('0,0,1,.28,1v.38h-.8v-.39a2,2,0,');
            data.append('0,0,0-.38.38.38,0,0,0-.11-.23.4');
            data.append('8.48,0,0,0-.29-.08.4.4,0,0,0-.4');
            data.append('4.34,2.1,2.1,0,0,0,0,.4v2a1.24,');
            data.append('1.24,0,0,0,.1.56.4.4,0,0,0,.37.');
            data.append('17.39.39,0,0,0,.28-.09.46.46,0,');
            data.append('0,0,.12-.24,2.18,2.18,0,0,0,0-.');
            data.append('39V17h.8v.36a1.61,1.61,0,0,1-.2');
            data.append('8,1,1.12,1.12,0,0,1-.95.36A1.18');
            data.append(',1.18,0,0,1,18.19,18.3Z\\"/><pa');
            data.append('th d=\\"M21.11,18.31a1.74,1.74,');
            data.append('0,0,1-.3-1.1V15.5a1.71,1.71,0,0');
            data.append(',1,.3-1.09,1.26,1.26,0,0,1,1-.3');
            data.append('7,1.23,1.23,0,0,1,1,.37,1.65,1.');
            data.append('65,0,0,1,.31,1.09v1.71a1.74,1.7');
            data.append('4,0,0,1-.31,1.1,1.22,1.22,0,0,1');
            data.append('-1,.38A1.2,1.2,0,0,1,21.11,18.3');
            data.append('1Zm1.38-.4a1.15,1.15,0,0,0,.1-.');
            data.append('51V15.31a.92.92,0,0,0-.1-.49c-.');
            data.append('06-.12-.18-.17-.37-.17s-.31,0-.');
            data.append('37.17a.94.94,0,0,0-.1.49V17.4a1');
            data.append(',1,0,0,0,.1.51.38.38,0,0,0,.37.');
            data.append('17A.39.39,0,0,0,22.49,17.91Z\\"');
            data.append('/><path d=\\"M23.92,14.09h.58l1');
            data.append('.11,2.59V14.09h.68v4.54h-.55l-1');
            data.append('.11-2.71v2.71h-.71Z\\"/><path d');
            data.append('=\\"M27.09,18.31a1.74,1.74,0,0,');
            data.append('1-.3-1.1V15.5a1.71,1.71,0,0,1,.');
            data.append('3-1.09,1.56,1.56,0,0,1,2,0,1.71');
            data.append(',1.71,0,0,1,.3,1.09v1.71a1.68,1');
            data.append('.68,0,0,1-.31,1.1,1.52,1.52,0,0');
            data.append(',1-2,0Zm1.38-.4a1,1,0,0,0,.1-.5');
            data.append('1V15.31a1,1,0,0,0-.09-.49.39.39');
            data.append(',0,0,0-.38-.17.37.37,0,0,0-.37.');
            data.append('17.94.94,0,0,0-.1.49V17.4a1,1,0');
            data.append(',0,0,.1.51.39.39,0,0,0,.37.17A.');
            data.append('38.38,0,0,0,28.47,17.91Z\\"/><p');
            data.append('ath d=\\"M30,14.09h.86l.64,3.15');
            data.append('.67-3.15H33l.08,4.54h-.62l-.06-');
            data.append('3.15-.65,3.15h-.5l-.65-3.16-.06');
            data.append(',3.16H29.9Z\\"/><path d=\\"M33.');
            data.append('64,14.09h.82v4.54h-.82Z\\"/><pa');
            data.append('th d=\\"M35.27,18.3A1.84,1.84,0');
            data.append(',0,1,35,17.18V15.56a1.81,1.81,0');
            data.append(',0,1,.29-1.13,1.16,1.16,0,0,1,1');
            data.append('-.39,1.17,1.17,0,0,1,.95.34,1.5');
            data.append('1,1.51,0,0,1,.28,1v.38h-.8v-.39');
            data.append('a3.47,3.47,0,0,0,0-.38.46.46,0,');
            data.append('0,0-.12-.23.44.44,0,0,0-.29-.08');
            data.append('.45.45,0,0,0-.3.09.46.46,0,0,0-');
            data.append('.13.25,2.1,2.1,0,0,0,0,.4v2a1.1');
            data.append('2,1.12,0,0,0,.1.56.4.4,0,0,0,.3');
            data.append('6.17.4.4,0,0,0,.29-.09.46.46,0,');
            data.append('0,0,.12-.24,3.84,3.84,0,0,0,0-.');
            data.append('39V17h.8v.36a1.67,1.67,0,0,1-.2');
            data.append('8,1,1.12,1.12,0,0,1-.95.36A1.18');
            data.append(',1.18,0,0,1,35.27,18.3Z\\"/><pa');
            data.append('th d=\\"M39.42,18.29a2,2,0,0,1-');
            data.append('.28-1.16V15.61a1.91,1.91,0,0,1,');
            data.append('.29-1.17,1.14,1.14,0,0,1,1-.4,1');
            data.append('.18,1.18,0,0,1,1,.34,1.42,1.42,');
            data.append('0,0,1,.3,1v.24H40.9v-.26a1.41,1');
            data.append('.41,0,0,0,0-.39.36.36,0,0,0-.12');
            data.append('-.22.45.45,0,0,0-.3-.08.41.41,0');
            data.append(',0,0-.31.1A.53.53,0,0,0,40,15a2');
            data.append('.22,2.22,0,0,0,0,.41v1.89a1.24,');
            data.append('1.24,0,0,0,.11.58.37.37,0,0,0,.');
            data.append('38.19.41.41,0,0,0,.39-.2,1.23,1');
            data.append('.23,0,0,0,.11-.61v-.42h-.48v-.5');
            data.append('2h1.23v2.3h-.54l-.06-.44a.76.76');
            data.append(',0,0,1-.76.5A1.05,1.05,0,0,1,39');
            data.append('.42,18.29Z\\"/><path d=\\"M42.2');
            data.append('3,14.09h1.09a1.74,1.74,0,0,1,1.');
            data.append('07.27,1.12,1.12,0,0,1,.35.94,1.');
            data.append('73,1.73,0,0,1-.12.7.83.83,0,0,1');
            data.append('-.44.4l.64,2.23H44l-.55-2.08h-.');
            data.append('39v2.08h-.82ZM43.32,16a.66.66,0');
            data.append(',0,0,.5-.17.75.75,0,0,0,.14-.53');
            data.append('.81.81,0,0,0-.13-.52.55.55,0,0,');
            data.append('0-.47-.16h-.31V16Z\\"/><path d=');
            data.append('\\"M45.49,18.31a1.74,1.74,0,0,1');
            data.append('-.3-1.1V15.5a1.71,1.71,0,0,1,.3');
            data.append('-1.09,1.55,1.55,0,0,1,2,0,1.71,');
            data.append('1.71,0,0,1,.3,1.09v1.71a1.74,1.');
            data.append('74,0,0,1-.3,1.1,1.23,1.23,0,0,1');
            data.append('-1,.38A1.2,1.2,0,0,1,45.49,18.3');
            data.append('1Zm1.38-.4A1.16,1.16,0,0,0,47,1');
            data.append('7.4V15.31a1,1,0,0,0-.09-.49.37.');
            data.append('37,0,0,0-.37-.17c-.19,0-.32,0-.');
            data.append('38.17a1.07,1.07,0,0,0-.09.49V17');
            data.append('.4a1.16,1.16,0,0,0,.09.51.5.5,0');
            data.append(',0,0,.75,0Z\\"/><path d=\\"M48.');
            data.append('14,14.09h.69L49.2,17l.47-2.93h.');
            data.append('56L50.72,17l.37-2.94h.68l-.63,4');
            data.append('.54h-.67l-.51-3-.5,3h-.68Z\\"/>');
            data.append('<path d=\\"M52.62,14.7h-.75v-.6');
            data.append('1h2.32v.61h-.74v3.93h-.83Z\\"/>');
            data.append('<path d=\\"M54.46,14.09h.82V16h');
            data.append('.92v-1.9H57v4.54H56.2V16.58h-.9');
            data.append('2v2.05h-.82Z\\"/><path d=\\"M43');
            data.append(',31.89l-6.36,6a1,1,0,0,0-.36.9V');
            data.append('55.78a.37.37,0,0,0,.36.37h6.56a');
            data.append('.38.38,0,0,0,.37-.37V32c0-.2-.1');
            data.append('6-.56-.57-.15\\"/><path d=\\"M2');
            data.append('4.67,39.77l-6.35,6a1.05,1.05,0,');
            data.append('0,0-.37.91v9.06a.38.38,0,0,0,.3');
            data.append('7.37h6.56a.37.37,0,0,0,.36-.37V');
            data.append('39.92c0-.2-.16-.57-.57-.15\\"/>');
            data.append('<path d=\\"M45.86,24.56a.16.16,');
            data.append('0,0,0,0-.14.26.26,0,0,0-.12-.05');
            data.append('h-.08l-4.87,1.1h-.09l-.09.05a.1');
            data.append('8.18,0,0,0,0,.27l0,.05L41.72,27');
            data.append('l-11,11-5.09-5.1a.17.17,0,0,0-.');
            data.append('21,0L24,34.28h0l-8.17,8.16a.17.');
            data.append('17,0,0,0,0,.21L17.24,44a.13.13,');
            data.append('0,0,0,.2,0L25.5,36l3.7,3.7h0l1.');
            data.append('38,1.38a.15.15,0,0,0,.21,0L43.3');
            data.append('1,28.55l1.17,1.17a.19.19,0,0,0,');
            data.append('.26,0,.21.21,0,0,0,0-.12v0l1.07');
            data.append('-5Z\\"/><path d=\\"M33.86,40.83');
            data.append('l-3.08,3.1a.14.14,0,0,1-.19,0L2');
            data.append('7.8,41.08c-.51-.51-.62-.1-.62.1');
            data.append('v14.6a.37.37,0,0,0,.36.37h6.57a');
            data.append('.37.37,0,0,0,.36-.37V40.94c0-.2');
            data.append('-.16-.56-.61-.11\\"/></g></svg>');

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
    #[available_gas(1659000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @237_u32, 'Couldn\'t get data');
        let mut arr: Array<felt252> = ArrayTrait::new();
    }
}
