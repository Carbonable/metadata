const NAME: felt252 = 'SDG10.svg';

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

            data.append(' id=\\"SDG10\\" xmlns=\\"http://');
            data.append('www.w3.org/2000/svg\\" viewBox=');
            data.append('\\"0 0 62.15 62.15\\"><rect fil');
            data.append('l=\\"#e01a83\\" width=\\"62.15');
            data.append('\\" height=\\"62.15\\"/><g fill');
            data.append('=\\"#fff\\"><path d=\\"M5.42,7.');
            data.append('75c-.11,0-.42.18-.94.36s-.67.23');
            data.append('-.78.28V6.71a8.7,8.7,0,0,0,1.21');
            data.append('-.59,4.05,4.05,0,0,0,1-.71H7.68');
            data.append('V17.26H5.42Z\\"/><path d=\\"M9.');
            data.append('67,16.53A3.61,3.61,0,0,1,8.85,1');
            data.append('4V8.73a3.86,3.86,0,0,1,.79-2.56');
            data.append('A3,3,0,0,1,12,5.24a3,3,0,0,1,2.');
            data.append('37.93,3.86,3.86,0,0,1,.79,2.56V');
            data.append('14a3.6,3.6,0,0,1-.82,2.48,2.94,');
            data.append('2.94,0,0,1-2.34.94A3,3,0,0,1,9.');
            data.append('67,16.53ZM12.89,14V8.77a3,3,0,0');
            data.append(',0-.17-1.1A.67.67,0,0,0,12,7.23');
            data.append('a.69.69,0,0,0-.72.44,3.08,3.08,');
            data.append('0,0,0-.16,1.1V14c0,1,.29,1.48.8');
            data.append('8,1.48S12.89,15,12.89,14Z\\"/><');
            data.append('path d=\\"M19.86,9.93V5.4H21a2.');
            data.append('2,2.2,0,0,1,.77.11.85.85,0,0,1,');
            data.append('.48.37,1.31,1.31,0,0,1,.17.71,2');
            data.append('.49,2.49,0,0,1-.05.5.9.9,0,0,1-');
            data.append('.17.37.83.83,0,0,1-.33.24l.63,2');
            data.append('.23h-.83l-.55-2.08h-.38V9.93Zm.');
            data.append('83-2.6H21a.81.81,0,0,0,.38-.07A');
            data.append('.41.41,0,0,0,21.54,7a1.12,1.12,');
            data.append('0,0,0,.06-.4.84.84,0,0,0-.13-.5');
            data.append('1A.57.57,0,0,0,21,6h-.3Z\\"/><p');
            data.append('ath d=\\"M22.84,9.93V5.4h1.91V6');
            data.append('H23.67v1.3h.85v.58h-.85v1.5h1.0');
            data.append('9v.57Z\\"/><path d=\\"M25.09,9.');
            data.append('93V5.4h1.07a2.06,2.06,0,0,1,.87');
            data.append('.15.9.9,0,0,1,.44.46,2.06,2.06,');
            data.append('0,0,1,.13.8V8.46a2.17,2.17,0,0,');
            data.append('1-.13.82,1,1,0,0,1-.44.49,1.88,');
            data.append('1.88,0,0,1-.83.16Zm.83-.58h.25a');
            data.append('.63.63,0,0,0,.41-.1A.45.45,0,0,');
            data.append('0,26.73,9a3.23,3.23,0,0,0,0-.48');
            data.append('V6.75a1.78,1.78,0,0,0,0-.44.41.');
            data.append('41,0,0,0-.16-.25.8.8,0,0,0-.4-.');
            data.append('08h-.24Z\\"/><path d=\\"M29.31,');
            data.append('10a1.38,1.38,0,0,1-.79-.19.93.9');
            data.append('3,0,0,1-.38-.52A2.81,2.81,0,0,1');
            data.append(',28,8.46V5.4h.81V8.56a2.61,2.61');
            data.append(',0,0,0,0,.4.69.69,0,0,0,.13.3.4');
            data.append('.4,0,0,0,.32.11.37.37,0,0,0,.31');
            data.append('-.11.59.59,0,0,0,.13-.3,2.6,2.6');
            data.append(',0,0,0,0-.4V5.4h.8V8.46a2.5,2.5');
            data.append(',0,0,1-.11.82.88.88,0,0,1-.38.5');
            data.append('2A1.34,1.34,0,0,1,29.31,10Z\\"/');
            data.append('><path d=\\"M32.3,10a1.36,1.36,');
            data.append('0,0,1-.78-.2,1,1,0,0,1-.39-.53A');
            data.append('2.37,2.37,0,0,1,31,8.48V6.86a2.');
            data.append('38,2.38,0,0,1,.11-.8.92.92,0,0,');
            data.append('1,.39-.53,1.45,1.45,0,0,1,.78-.');
            data.append('18,1.4,1.4,0,0,1,.74.16.85.85,0');
            data.append(',0,1,.38.45,2.08,2.08,0,0,1,.11');
            data.append('.69V7h-.8V6.64a1.94,1.94,0,0,0,');
            data.append('0-.35.4.4,0,0,0-.1-.25.41.41,0,');
            data.append('0,0-.3-.09.4.4,0,0,0-.31.1.43.4');
            data.append('3,0,0,0-.13.26,2.13,2.13,0,0,0,');
            data.append('0,.37v2a2.18,2.18,0,0,0,0,.41A.');
            data.append('49.49,0,0,0,32,9.3a.47.47,0,0,0');
            data.append(',.28.08.35.35,0,0,0,.29-.1A.42.');
            data.append('42,0,0,0,32.71,9a2.06,2.06,0,0,');
            data.append('0,0-.36V8.25h.8v.36a2.27,2.27,0');
            data.append(',0,1-.11.72.89.89,0,0,1-.37.48A');
            data.append('1.34,1.34,0,0,1,32.3,10Z\\"/><p');
            data.append('ath d=\\"M34,9.93V5.4h1.9V6H34.');
            data.append('79v1.3h.84v.58h-.84v1.5h1.08v.5');
            data.append('7Z\\"/><path d=\\"M36.21,9.93V5');
            data.append('.4h1.07a2,2,0,0,1,.86.15.86.86,');
            data.append('0,0,1,.44.46,2.06,2.06,0,0,1,.1');
            data.append('3.8V8.46a2.17,2.17,0,0,1-.13.82');
            data.append('.94.94,0,0,1-.43.49,2,2,0,0,1-.');
            data.append('84.16ZM37,9.35h.25a.65.65,0,0,0');
            data.append(',.41-.1A.45.45,0,0,0,37.85,9a3.');
            data.append('4,3.4,0,0,0,0-.48V6.75a2.59,2.5');
            data.append('9,0,0,0,0-.44.38.38,0,0,0-.17-.');
            data.append('25A.76.76,0,0,0,37.28,6H37Z\\"/');
            data.append('><path d=\\"M19.89,17.33V12.8h.');
            data.append('81v4.53Z\\"/><path d=\\"M21.26,');
            data.append('17.33V12.8h.57l1.1,2.58V12.8h.6');
            data.append('9v4.53h-.55L22,14.62v2.71Z\\"/>');
            data.append('<path d=\\"M24.16,17.33V12.8h1.');
            data.append('9v.58H25v1.3h.84v.58H25v1.5h1.0');
            data.append('8v.57Z\\"/><path d=\\"M28.62,18');
            data.append('.23a1.31,1.31,0,0,1-.3-.2,3.07,');
            data.append('3.07,0,0,1-.32-.31,2,2,0,0,1-.2');
            data.append('6-.34h-.1a1.44,1.44,0,0,1-.77-.');
            data.append('18,1,1,0,0,1-.41-.51,2.41,2.41,');
            data.append('0,0,1-.12-.8V14.21a2.3,2.3,0,0,');
            data.append('1,.12-.79,1,1,0,0,1,.41-.5,1.85');
            data.append(',1.85,0,0,1,1.55,0,1,1,0,0,1,.4');
            data.append('.5,2.08,2.08,0,0,1,.13.79v1.7a2');
            data.append('.74,2.74,0,0,1-.06.59,1.33,1.33');
            data.append(',0,0,1-.21.45.88.88,0,0,1-.36.3');
            data.append(',1.1,1.1,0,0,0,.15.16l.15.16.15');
            data.append('.12Zm-1-1.45a.38.38,0,0,0,.44-.');
            data.append('34,1.72,1.72,0,0,0,0-.34V14a1.7');
            data.append('2,1.72,0,0,0,0-.34.47.47,0,0,0-');
            data.append('.13-.24.46.46,0,0,0-.31-.09.41.');
            data.append('41,0,0,0-.3.09.48.48,0,0,0-.14.');
            data.append('24,1.72,1.72,0,0,0,0,.34V16.1a1');
            data.append('.72,1.72,0,0,0,0,.34.47.47,0,0,');
            data.append('0,.14.25A.41.41,0,0,0,27.64,16.');
            data.append('78Z\\"/><path d=\\"M30.66,17.39');
            data.append('a1.41,1.41,0,0,1-.78-.18,1,1,0,');
            data.append('0,1-.39-.53,2.81,2.81,0,0,1-.11');
            data.append('-.82V12.8h.81V16a2.6,2.6,0,0,0,');
            data.append('0,.4.59.59,0,0,0,.13.3.38.38,0,');
            data.append('0,0,.31.11.4.4,0,0,0,.32-.11.68');
            data.append('.68,0,0,0,.12-.3,2.6,2.6,0,0,0,');
            data.append('0-.4V12.8h.8v3.06a2.83,2.83,0,0');
            data.append(',1-.1.82,1,1,0,0,1-.39.53A1.41,');
            data.append('1.41,0,0,1,30.66,17.39Z\\"/><pa');
            data.append('th d=\\"M32.19,17.33l.9-4.53H34');
            data.append('l.9,4.53h-.76l-.18-1h-.79l-.19,');
            data.append('1Zm1-1.57h.62l-.31-1.91Z\\"/><p');
            data.append('ath d=\\"M35.17,17.33V12.8H36v4');
            data.append('h1.09v.57Z\\"/><path d=\\"M37.3');
            data.append('8,17.33V12.8h.81v4.53Z\\"/><pat');
            data.append('h d=\\"M39.2,17.33V13.41h-.72V1');
            data.append('2.8h2.26v.61H40v3.92Z\\"/><path');
            data.append(' d=\\"M41,17.33V12.8h.82v4.53Z');
            data.append('\\"/><path d=\\"M42.4,17.33V12.');
            data.append('8h1.9v.58H43.23v1.3h.84v.58h-.8');
            data.append('4v1.5h1.08v.57Z\\"/><path d=\\"');
            data.append('M45.79,17.39a1.29,1.29,0,0,1-.6');
            data.append('8-.16,1,1,0,0,1-.42-.47,2,2,0,0');
            data.append(',1-.15-.75l.71-.14a2.05,2.05,0,');
            data.append('0,0,.06.46.69.69,0,0,0,.16.31.3');
            data.append('8.38,0,0,0,.29.11.33.33,0,0,0,.');
            data.append('29-.12.56.56,0,0,0,.08-.3.83.83');
            data.append(',0,0,0-.13-.49,2.1,2.1,0,0,0-.3');
            data.append('6-.38l-.57-.5a1.64,1.64,0,0,1-.');
            data.append('38-.46,1.22,1.22,0,0,1-.15-.63,');
            data.append('1.07,1.07,0,0,1,.32-.83,1.16,1.');
            data.append('16,0,0,1,.85-.29,1.19,1.19,0,0,');
            data.append('1,.53.1.76.76,0,0,1,.34.27,1,1,');
            data.append('0,0,1,.19.39,2.31,2.31,0,0,1,.0');
            data.append('8.47l-.71.12a2.06,2.06,0,0,0,0-');
            data.append('.38.49.49,0,0,0-.12-.26.37.37,0');
            data.append(',0,0-.28-.1.35.35,0,0,0-.28.12.');
            data.append('49.49,0,0,0-.1.3.71.71,0,0,0,.1');
            data.append('.38,1.22,1.22,0,0,0,.27.3l.57.5');
            data.append('a2.53,2.53,0,0,1,.48.55,1.45,1.');
            data.append('45,0,0,1,.2.77,1.08,1.08,0,0,1-');
            data.append('.15.57,1,1,0,0,1-.39.4A1.27,1.2');
            data.append('7,0,0,1,45.79,17.39Z\\"/><path');
            data.append(' d=\\"M36.84,40.78H25.4a.13.13,');
            data.append('0,0,0-.13.14v3.44a.13.13,0,0,0,');
            data.append('.13.14H36.84a.13.13,0,0,0,.13-.');
            data.append('14V40.92a.13.13,0,0,0-.13-.14\\');
            data.append('"/><path d=\\"M36.84,33.46H25.4');
            data.append('a.13.13,0,0,0-.13.14V37a.13.13,');
            data.append('0,0,0,.13.14H36.84A.13.13,0,0,0');
            data.append(',37,37V33.6a.13.13,0,0,0-.13-.1');
            data.append('4\\"/><path d=\\"M36.68,28.26l-');
            data.append('5.49-5.49a.1.1,0,0,0-.14,0l-5.4');
            data.append('9,5.49a.09.09,0,0,0,.06.16h11A.');
            data.append('09.09,0,0,0,36.68,28.26Z\\"/><p');
            data.append('ath d=\\"M41.84,44.54l5.49-5.49');
            data.append('a.1.1,0,0,0,0-.14l-5.49-5.49a.1');
            data.append('.1,0,0,0-.17.07v11A.1.1,0,0,0,4');
            data.append('1.84,44.54Z\\"/><path d=\\"M25.');
            data.append('56,49.7l5.49,5.49a.1.1,0,0,0,.1');
            data.append('4,0l5.49-5.49a.09.09,0,0,0-.07-');
            data.append('.16h-11A.09.09,0,0,0,25.56,49.7');
            data.append('Z\\"/><path d=\\"M20.4,33.42l-5');
            data.append('.49,5.49a.1.1,0,0,0,0,.14l5.49,');
            data.append('5.49a.09.09,0,0,0,.16-.07v-11A.');
            data.append('09.09,0,0,0,20.4,33.42Z\\"/></g');
            data.append('></svg>');

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
    #[available_gas(1253000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @179_u32, 'Couldn\'t get data');
        let mut arr: Array<felt252> = ArrayTrait::new();
    }
}
