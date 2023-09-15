const NAME: felt252 = 'SDG17.svg';

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

            data.append(' id=\\"SDG17\\" xmlns=\\"http://');
            data.append('www.w3.org/2000/svg\\" viewBox=');
            data.append('\\"0 0 62.13 62.13\\"><rect fil');
            data.append('l=\\"#1a3668\\" width=\\"62.13');
            data.append('\\" height=\\"62.13\\"/><g fill');
            data.append('=\\"#fff\\"><path d=\\"M5.41,7.');
            data.append('74a9.74,9.74,0,0,1-.93.37c-.41.');
            data.append('14-.67.23-.78.28V6.71a10.78,10.');
            data.append('78,0,0,0,1.21-.59,3.8,3.8,0,0,0');
            data.append(',1-.72H7.68V17.25H5.41Z\\"/><pa');
            data.append('th d=\\"M12.24,7.13H9V5.4h5.42V');
            data.append('6.88L12,17.25H9.76Z\\"/><path d');
            data.append('=\\"M19.86,5.4h1.33c.77,0,1.16.');
            data.append('42,1.16,1.28a1.08,1.08,0,0,1-1.');
            data.append('22,1.23h-.45v2h-.82ZM21,7.33a.5');
            data.append('9.59,0,0,0,.45-.14.83.83,0,0,0,');
            data.append('.12-.51,1.56,1.56,0,0,0,0-.42.3');
            data.append('7.37,0,0,0-.16-.21A.71.71,0,0,0');
            data.append(',21,6h-.32V7.33Z\\"/><path d=\\');
            data.append('"M23.13,5.4H24l.9,4.52h-.76l-.1');
            data.append('8-1h-.79l-.18,1h-.78Zm.76,2.95-');
            data.append('.31-1.9-.31,1.9Z\\"/><path d=\\');
            data.append('"M25.25,5.4h1.09a1.74,1.74,0,0,');
            data.append('1,1.07.27,1.09,1.09,0,0,1,.36.9');
            data.append('3,1.75,1.75,0,0,1-.13.7.75.75,0');
            data.append(',0,1-.43.39l.63,2.23H27l-.54-2.');
            data.append('07h-.39V9.92h-.83Zm1.09,1.94a.6');
            data.append('6.66,0,0,0,.5-.17A.75.75,0,0,0,');
            data.append('27,6.64a.88.88,0,0,0-.13-.52A.5');
            data.append('9.59,0,0,0,26.38,6h-.3V7.34Z\\"');
            data.append('/><path d=\\"M28.71,6H28V5.4h2.');
            data.append('32V6h-.75V9.92h-.82Z\\"/><path');
            data.append(' d=\\"M30.52,5.4h.57L32.19,8V5.');
            data.append('4h.69V9.92h-.55l-1.11-2.7v2.7h-');
            data.append('.7Z\\"/><path d=\\"M33.44,5.4h1');
            data.append('.9V6H34.26v1.3h.85v.58h-.85v1.5');
            data.append('h1.09v.56H33.44Z\\"/><path d=\\');
            data.append('"M35.71,5.4H36.8a1.74,1.74,0,0,');
            data.append('1,1.07.27,1.09,1.09,0,0,1,.35.9');
            data.append('3,1.76,1.76,0,0,1-.12.7.77.77,0');
            data.append(',0,1-.44.39l.64,2.23h-.83l-.54-');
            data.append('2.07h-.4V9.92h-.82ZM36.8,7.34a.');
            data.append('66.66,0,0,0,.5-.17.75.75,0,0,0,');
            data.append('.15-.53.81.81,0,0,0-.14-.52A.55');
            data.append('.55,0,0,0,36.84,6h-.31V7.34Z\\"');
            data.append('/><path d=\\"M39,9.64a1.6,1.6,0');
            data.append(',0,1-.34-1l.71-.14a1.7,1.7,0,0,');
            data.append('0,.14.65.41.41,0,0,0,.38.23.32.');
            data.append('32,0,0,0,.28-.12.48.48,0,0,0,.0');
            data.append('9-.31.79.79,0,0,0-.12-.45,2.16,');
            data.append('2.16,0,0,0-.37-.41l-.57-.5a1.89');
            data.append(',1.89,0,0,1-.4-.48,1.29,1.29,0,');
            data.append('0,1-.13-.62,1.06,1.06,0,0,1,.31');
            data.append('-.82,1.21,1.21,0,0,1,.87-.3,1,1');
            data.append(',0,0,1,.83.34,1.58,1.58,0,0,1,.');
            data.append('29.9l-.71.12a1.86,1.86,0,0,0-.0');
            data.append('9-.56A.33.33,0,0,0,39.8,6a.38.3');
            data.append('8,0,0,0-.3.12.45.45,0,0,0-.11.3');
            data.append('1.66.66,0,0,0,.09.36,1.3,1.3,0,');
            data.append('0,0,.28.32l.57.5a2.6,2.6,0,0,1,');
            data.append('.49.59,1.43,1.43,0,0,1,.18.72,1');
            data.append('.21,1.21,0,0,1-.14.58,1,1,0,0,1');
            data.append('-.4.39A1.32,1.32,0,0,1,39,9.64Z');
            data.append('\\"/><path d=\\"M41.38,5.4h.82V');
            data.append('7.29h.92V5.4H44V9.92h-.83v-2H42');
            data.append('.2v2h-.82Z\\"/><path d=\\"M44.5');
            data.append('4,5.4h.82V9.92h-.82Z\\"/><path');
            data.append(' d=\\"M45.93,5.4h1.34c.77,0,1.1');
            data.append('5.42,1.15,1.28a1.08,1.08,0,0,1-');
            data.append('1.21,1.23h-.45v2h-.83Zm1.15,1.9');
            data.append('3a.59.59,0,0,0,.45-.14.83.83,0,');
            data.append('0,0,.12-.51,2.12,2.12,0,0,0,0-.');
            data.append('42.37.37,0,0,0-.16-.21A.74.74,0');
            data.append(',0,0,47.08,6h-.32V7.33Z\\"/><pa');
            data.append('th d=\\"M49,9.64a1.66,1.66,0,0,');
            data.append('1-.33-1l.71-.14a1.55,1.55,0,0,0');
            data.append(',.13.65.41.41,0,0,0,.38.23.32.3');
            data.append('2,0,0,0,.28-.12.43.43,0,0,0,.1-');
            data.append('.31.79.79,0,0,0-.12-.45,2.26,2.');
            data.append('26,0,0,0-.38-.41l-.57-.5a1.89,1');
            data.append('.89,0,0,1-.4-.48,1.42,1.42,0,0,');
            data.append('1-.13-.62A1.06,1.06,0,0,1,49,5.');
            data.append('64a1.17,1.17,0,0,1,.86-.3,1,1,0');
            data.append(',0,1,.84.34,1.74,1.74,0,0,1,.29');
            data.append('.9l-.71.12a2.18,2.18,0,0,0-.1-.');
            data.append('56A.33.33,0,0,0,49.83,6a.41.41,');
            data.append('0,0,0-.3.12.45.45,0,0,0-.11.31.');
            data.append('66.66,0,0,0,.09.36,1.56,1.56,0,');
            data.append('0,0,.28.32l.57.5a2.66,2.66,0,0,');
            data.append('1,.5.59,1.53,1.53,0,0,1,.17.72,');
            data.append('1.11,1.11,0,0,1-.14.58.94.94,0,');
            data.append('0,1-.4.39A1.32,1.32,0,0,1,49,9.');
            data.append('64Z\\"/><path d=\\"M19.86,12.79');
            data.append('h1.86v.57h-1v1.32h.85v.58h-.85v');
            data.append('2.06h-.82Z\\"/><path d=\\"M22.2');
            data.append('3,17a1.75,1.75,0,0,1-.3-1.11V14');
            data.append('.2a1.71,1.71,0,0,1,.3-1.09,1.55');
            data.append(',1.55,0,0,1,2,0,1.71,1.71,0,0,1');
            data.append(',.3,1.09v1.7A1.73,1.73,0,0,1,24');
            data.append('.23,17a1.2,1.2,0,0,1-1,.38A1.23');
            data.append(',1.23,0,0,1,22.23,17Zm1.37-.41a');
            data.append('1,1,0,0,0,.1-.5V14a1,1,0,0,0-.0');
            data.append('9-.49.37.37,0,0,0-.37-.17c-.19,');
            data.append('0-.32.05-.38.17a1.07,1.07,0,0,0');
            data.append('-.09.49V16.1a1.09,1.09,0,0,0,.0');
            data.append('9.5.39.39,0,0,0,.38.18A.36.36,0');
            data.append(',0,0,23.6,16.6Z\\"/><path d=\\"');
            data.append('M25,12.79h1.09a1.69,1.69,0,0,1,');
            data.append('1.07.28,1.12,1.12,0,0,1,.35.93,');
            data.append('1.76,1.76,0,0,1-.12.7.77.77,0,0');
            data.append(',1-.44.39l.63,2.23h-.82l-.55-2.');
            data.append('07H25.8v2.07H25Zm1.09,1.94a.65.');
            data.append('65,0,0,0,.5-.16.82.82,0,0,0,.14');
            data.append('-.53.81.81,0,0,0-.13-.52.57.57,');
            data.append('0,0,0-.47-.16H25.8v1.37Z\\"/><p');
            data.append('ath d=\\"M29.58,13.4h-.75v-.61h');
            data.append('2.32v.61H30.4v3.92h-.82Z\\"/><p');
            data.append('ath d=\\"M31.36,12.79h.82v1.89h');
            data.append('.92V12.79h.83v4.53H33.1v-2h-.92');
            data.append('v2h-.82Z\\"/><path d=\\"M34.45,');
            data.append('12.79h1.9v.59H35.28v1.3h.85v.57');
            data.append('h-.85v1.51h1.09v.56H34.45Z\\"/>');
            data.append('<path d=\\"M38.08,17a2,2,0,0,1-');
            data.append('.28-1.16V14.31a1.91,1.91,0,0,1,');
            data.append('.29-1.17,1.49,1.49,0,0,1,2-.06,');
            data.append('1.42,1.42,0,0,1,.29,1v.24h-.79V');
            data.append('14a2.06,2.06,0,0,0,0-.39.33.33,');
            data.append('0,0,0-.13-.22.4.4,0,0,0-.29-.08');
            data.append('.41.41,0,0,0-.31.1.53.53,0,0,0-');
            data.append('.13.26,2.17,2.17,0,0,0,0,.4V16a');
            data.append('1.41,1.41,0,0,0,.1.58.42.42,0,0');
            data.append(',0,.39.19.4.4,0,0,0,.39-.21,1.3');
            data.append('1,1.31,0,0,0,.11-.6v-.42h-.49V1');
            data.append('5h1.23v2.29h-.53l-.06-.44a.77.7');
            data.append('7,0,0,1-.76.51A1.08,1.08,0,0,1,');
            data.append('38.08,17Z\\"/><path d=\\"M41.06');
            data.append(',17a1.75,1.75,0,0,1-.3-1.11V14.');
            data.append('2a1.71,1.71,0,0,1,.3-1.09,1.23,');
            data.append('1.23,0,0,1,1-.37,1.27,1.27,0,0,');
            data.append('1,1,.37,1.71,1.71,0,0,1,.3,1.09');
            data.append('v1.7A1.73,1.73,0,0,1,43.06,17a1');
            data.append('.51,1.51,0,0,1-2,0Zm1.37-.41a1,');
            data.append('1,0,0,0,.1-.5V14a1,1,0,0,0-.09-');
            data.append('.49.39.39,0,0,0-.38-.17.37.37,0');
            data.append(',0,0-.37.17,1.06,1.06,0,0,0-.1.');
            data.append('49V16.1a1.07,1.07,0,0,0,.1.5.38');
            data.append('.38,0,0,0,.37.18A.37.37,0,0,0,4');
            data.append('2.43,16.6Z\\"/><path d=\\"M44.4');
            data.append('9,12.79h.88l.91,4.53h-.77l-.18-');
            data.append('1h-.79l-.18,1h-.78Zm.75,3-.31-1');
            data.append('.9-.3,1.9Z\\"/><path d=\\"M46.5');
            data.append('6,12.79h.82v4h1.1v.56H46.56Z\\"');
            data.append('/><path d=\\"M49,17a1.56,1.56,0');
            data.append(',0,1-.33-1l.71-.14a1.56,1.56,0,');
            data.append('0,0,.13.66.41.41,0,0,0,.38.23.3');
            data.append('2.32,0,0,0,.28-.12.48.48,0,0,0,');
            data.append('.09-.31.79.79,0,0,0-.12-.45,2.1');
            data.append('6,2.16,0,0,0-.37-.41l-.57-.5a1.');
            data.append('76,1.76,0,0,1-.4-.49,1.25,1.25,');
            data.append('0,0,1-.13-.61A1.12,1.12,0,0,1,4');
            data.append('9,13a1.25,1.25,0,0,1,.87-.29.94');
            data.append('.94,0,0,1,.83.34,1.57,1.57,0,0,');
            data.append('1,.29.89l-.71.13a1.8,1.8,0,0,0-');
            data.append('.09-.56.33.33,0,0,0-.32-.19.38.');
            data.append('38,0,0,0-.3.12.45.45,0,0,0-.11.');
            data.append('31.69.69,0,0,0,.09.36,1.3,1.3,0');
            data.append(',0,0,.28.32l.57.5a2.6,2.6,0,0,1');
            data.append(',.49.59,1.43,1.43,0,0,1,.18.72,');
            data.append('1.11,1.11,0,0,1-.14.58.94.94,0,');
            data.append('0,1-.4.39A1.32,1.32,0,0,1,49,17');
            data.append('Z\\"/><path d=\\"M46.93,37.71a8');
            data.append('.14,8.14,0,0,0-7.83-8.12,8.13,8');
            data.append('.13,0,0,0-15.33,0,8.12,8.12,0,0');
            data.append(',0-4.69,14.53,8,8,0,0,0-.33,2.2');
            data.append('6,8.14,8.14,0,0,0,8.14,8.12,8,8');
            data.append(',0,0,0,4.58-1.42A8.05,8.05,0,0,');
            data.append('0,36,54.45,8.12,8.12,0,0,0,43.8');
            data.append(',44.11a8.12,8.12,0,0,0,3.13-6.4');
            data.append('m-9-5.41a6.5,6.5,0,0,1-5.54,6.4');
            data.append('1,6.63,6.63,0,0,1-.08-1,6.49,6.');
            data.append('49,0,0,1,5.53-6.41,6.52,6.52,0,');
            data.append('0,1,.09,1M31.46,51a6.48,6.48,0,');
            data.append('0,1-.06-9.25A6.46,6.46,0,0,1,31');
            data.append('.46,51M25,31.3a6.49,6.49,0,0,1,');
            data.append('5.53,6.41,6.63,6.63,0,0,1-.08,1');
            data.append('A6.4,6.4,0,0,1,25,31.3m4.84,9.3');
            data.append('2a6.5,6.5,0,0,1-5.8,3.58,6.35,6');
            data.append('.35,0,0,1-3-.73,6.49,6.49,0,0,1');
            data.append(',5.8-3.59,6.41,6.41,0,0,1,3,.74');
            data.append('m3.11,0a6.47,6.47,0,0,1,8.82,2.');
            data.append('89A6.47,6.47,0,0,1,33,40.57M31.');
            data.append('43,25.8a6.52,6.52,0,0,1,6,3.91,');
            data.append('8.15,8.15,0,0,0-6,4.57,8.13,8.1');
            data.append('3,0,0,0-5.95-4.57,6.5,6.5,0,0,1');
            data.append(',5.95-3.91M17.58,37.71a6.5,6.5,');
            data.append('0,0,1,5.79-6.45,8.79,8.79,0,0,0');
            data.append('-.07,1,8.12,8.12,0,0,0,2.66,6,8');
            data.append('.13,8.13,0,0,0-6.23,4.23,6.47,6');
            data.append('.47,0,0,1-2.15-4.82m2.81,8.67A6');
            data.append('.65,6.65,0,0,1,20.53,45a8.13,8.');
            data.append('13,0,0,0,7.46-.2A8.09,8.09,0,0,');
            data.append('0,30.15,52a6.48,6.48,0,0,1-9.76');
            data.append('-5.6m22.09-.06A6.49,6.49,0,0,1,');
            data.append('32.78,52,8.1,8.1,0,0,0,35,46.38');
            data.append('a7.94,7.94,0,0,0-.15-1.56,8.08,');
            data.append('8.08,0,0,0,3.94,1A7.94,7.94,0,0');
            data.append(',0,42.34,45a6.24,6.24,0,0,1,.14');
            data.append(',1.3M37,38.25a8.08,8.08,0,0,0,2');
            data.append('.6-6,8.81,8.81,0,0,0-.06-1,6.48');
            data.append(',6.48,0,0,1,3.66,11.25A8.16,8.1');
            data.append('6,0,0,0,37,38.25\\"/></g></svg>');

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
    #[available_gas(1491000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @213_u32, 'Couldn\'t get data');
        let mut arr: Array<felt252> = ArrayTrait::new();
    }
}
