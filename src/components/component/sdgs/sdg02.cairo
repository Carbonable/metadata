const NAME: felt252 = 'SDG02.svg';
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

            data.append(' id=\\"SDG2\\" xmlns=\\"http://w');
            data.append('ww.w3.org/2000/svg\\" viewBox=');
            data.append('\\"0 0 61.93 61.93\\"><rect fil');
            data.append('l=\\"#d19f2a\\" width=\\"61.93');
            data.append('\\" height=\\"61.93\\"/><g fill');
            data.append('=\\"#fff\\"><path d=\\"M5,15.61');
            data.append('l2.86-4.42L8,10.93a10.38,10.38,');
            data.append('0,0,0,.81-1.4A2.77,2.77,0,0,0,9');
            data.append('.11,8.3a1.51,1.51,0,0,0-.22-.87');
            data.append('.76.76,0,0,0-.63-.29.87.87,0,0,');
            data.append('0-.85.46,3,3,0,0,0-.23,1.29v.53');
            data.append('H5V8.84a4.08,4.08,0,0,1,.78-2.6');
            data.append('3,3,3,0,0,1,2.45-1,3.1,3.1,0,0,');
            data.append('1,2.32.81,3.14,3.14,0,0,1,.8,2.');
            data.append('3,3.74,3.74,0,0,1-.21,1.26,5,5,');
            data.append('0,0,1-.48,1.07c-.18.31-.47.75-.');
            data.append('86,1.33L7.52,15.42H11v1.77H5Z\\');
            data.append('"/><path d=\\"M16.15,9.36,17.36');
            data.append(',6H16.21V5.38h2V5.8L16.93,9.33h');
            data.append('1.26v.56h-2Z\\"/><path d=\\"M18');
            data.append('.64,5.38h1.89V6H19.46v1.3h.85v.');
            data.append('57h-.85v1.5h1.08v.56h-1.9Z\\"/>');
            data.append('<path d=\\"M21,5.38h1.08a1.76,1');
            data.append('.76,0,0,1,1.07.27,1.12,1.12,0,0');
            data.append(',1,.35.93,1.59,1.59,0,0,1-.13.7');
            data.append('.73.73,0,0,1-.43.39l.63,2.22h-.');
            data.append('82l-.54-2.07h-.39V9.89H21Zm1.08');
            data.append(',1.93a.65.65,0,0,0,.5-.16.77.77');
            data.append(',0,0,0,.14-.53.81.81,0,0,0-.13-');
            data.append('.52.55.55,0,0,0-.47-.16h-.3V7.3');
            data.append('1Z\\"/><path d=\\"M24.32,9.58a1');
            data.append('.74,1.74,0,0,1-.3-1.1V6.78a1.66');
            data.append(',1.66,0,0,1,.3-1.08,1.55,1.55,0');
            data.append(',0,1,2,0,1.66,1.66,0,0,1,.3,1.0');
            data.append('8v1.7a1.71,1.71,0,0,1-.31,1.09,');
            data.append('1.17,1.17,0,0,1-1,.38A1.24,1.24');
            data.append(',0,0,1,24.32,9.58Zm1.38-.41a1.0');
            data.append('9,1.09,0,0,0,.09-.5V6.59a1,1,0,');
            data.append('0,0-.09-.49.37.37,0,0,0-.37-.17');
            data.append('A.41.41,0,0,0,25,6.1a1.07,1.07,');
            data.append('0,0,0-.09.49V8.67a1.09,1.09,0,0');
            data.append(',0,.09.5.4.4,0,0,0,.38.18A.39.3');
            data.append('9,0,0,0,25.7,9.17Z\\"/><path d=');
            data.append('\\"M16.31,12.75h.82v1.89h.92V12');
            data.append('.75h.82v4.52h-.82v-2h-.92v2h-.8');
            data.append('2Z\\"/><path d=\\"M20,17.15a1,1');
            data.append(',0,0,1-.39-.51,2.73,2.73,0,0,1-');
            data.append('.11-.83V12.75h.81V15.9a1.58,1.5');
            data.append('8,0,0,0,.09.6.35.35,0,0,0,.37.2');
            data.append('2.38.38,0,0,0,.39-.22,1.58,1.58');
            data.append(',0,0,0,.09-.6V12.75H22v3.06a2.4');
            data.append('9,2.49,0,0,1-.11.83.91.91,0,0,1');
            data.append('-.39.51,1.39,1.39,0,0,1-.77.18A');
            data.append('1.44,1.44,0,0,1,20,17.15Z\\"/><');
            data.append('path d=\\"M22.66,12.75h.58l1.1,');
            data.append('2.58V12.75H25v4.52h-.55l-1.1-2.');
            data.append('7v2.7h-.71Z\\"/><path d=\\"M25.');
            data.append('88,16.93a2,2,0,0,1-.28-1.15V14.');
            data.append('26a2,2,0,0,1,.29-1.16,1.14,1.14');
            data.append(',0,0,1,1-.4,1.24,1.24,0,0,1,1,.');
            data.append('33,1.5,1.5,0,0,1,.29,1v.23h-.79');
            data.append('V14a1.92,1.92,0,0,0,0-.39.35.35');
            data.append(',0,0,0-.13-.23.55.55,0,0,0-.6,0');
            data.append(',.58.58,0,0,0-.13.26,2.29,2.29,');
            data.append('0,0,0,0,.41V16a1.35,1.35,0,0,0,');
            data.append('.1.57.4.4,0,0,0,.39.19.41.41,0,');
            data.append('0,0,.39-.2,1.31,1.31,0,0,0,.11-');
            data.append('.6v-.43h-.49V15h1.23v2.29h-.54l');
            data.append('-.05-.44a.77.77,0,0,1-.77.5A1,1');
            data.append(',0,0,1,25.88,16.93Z\\"/><path d');
            data.append('=\\"M28.76,12.75h1.9v.58H29.58v');
            data.append('1.3h.85v.58h-.85V16.7h1.09v.57H');
            data.append('28.76Z\\"/><path d=\\"M31.12,12');
            data.append('.75h1.09a1.72,1.72,0,0,1,1.06.2');
            data.append('7,1.09,1.09,0,0,1,.35.93,1.73,1');
            data.append('.73,0,0,1-.12.7.77.77,0,0,1-.44');
            data.append('.39l.63,2.23h-.82l-.54-2.07h-.3');
            data.append('9v2.07h-.82Zm1.08,1.94a.7.7,0,0');
            data.append(',0,.5-.16.78.78,0,0,0,.15-.53.8');
            data.append('6.86,0,0,0-.13-.52.58.58,0,0,0-');
            data.append('.47-.16h-.31v1.37Z\\"/><path d=');
            data.append('\\"M24.67,52.72v.92a.42.42,0,0,');
            data.append('0,.41.39h10.3a.41.41,0,0,0,.4-.');
            data.append('41h0v-1A16,16,0,0,0,46.84,40.34');
            data.append('v0a.13.13,0,0,0,0-.06.41.41,0,0');
            data.append(',0-.42-.41H13.73a.41.41,0,0,0-.');
            data.append('42.41l0,.19A16,16,0,0,0,24.67,5');
            data.append('2.72\\"/><path d=\\"M35.77,25.8');
            data.append('8c-.13.19-3.29,4.74.07,8.42a3.6');
            data.append('8,3.68,0,0,1,1,4.18H39a5.28,5.2');
            data.append('8,0,0,0-1.5-5.26c-2.48-2.71,0-6');
            data.append('.38.07-6.44a.8.8,0,0,0-.35-1.2,');
            data.append('1.14,1.14,0,0,0-1.42.3\\"/><pat');
            data.append('h d=\\"M30.3,38.48h2.16A5.29,5.');
            data.append('29,0,0,0,31,33.22c-2.48-2.71,0-');
            data.append('6.38.06-6.44a.8.8,0,0,0-.35-1.2');
            data.append(',1.14,1.14,0,0,0-1.42.3c-.13.19');
            data.append('-3.29,4.74.07,8.42a3.67,3.67,0,');
            data.append('0,1,1,4.18\\"/><path d=\\"M22.7');
            data.append('6,25.88c-.14.19-3.3,4.74.07,8.4');
            data.append('2a3.68,3.68,0,0,1,1,4.18H26a5.3');
            data.append(',5.3,0,0,0-1.49-5.26c-2.48-2.71');
            data.append(',0-6.38.07-6.44a.81.81,0,0,0-.3');
            data.append('6-1.2,1.11,1.11,0,0,0-1.41.3\\"');
            data.append('/></g></svg>');

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
    #[available_gas(749000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @107_u32, 'Couldn\'t get data');
        let mut arr: Array<felt252> = ArrayTrait::new();
    }
}
