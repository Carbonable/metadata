const NAME: felt252 = 'SDG04.svg';
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

            data.append(' id=\\"SDG4\\" xmlns=\\"http://w');
            data.append('ww.w3.org/2000/svg\\" viewBox=');
            data.append('\\"0 0 61.93 61.93\\"><rect fil');
            data.append('l=\\"#c22033\\" width=\\"61.93');
            data.append('\\" height=\\"61.93\\"/><g fill');
            data.append('=\\"#fff\\"><path d=\\"M8.29,14');
            data.append('.4H4.73V12.62L7.81,5.39h2.52v7.');
            data.append('3h1.18V14.4H10.33v2.79h-2Zm0-1.');
            data.append('71v-5l-1.79,5Z\\"/><path d=\\"M');
            data.append('18.05,10.45a3.27,3.27,0,0,1-.43');
            data.append('-.5h-.09a1.24,1.24,0,0,1-1-.37,');
            data.append('1.74,1.74,0,0,1-.3-1.1V6.78a1.7');
            data.append('1,1.71,0,0,1,.3-1.09,1.27,1.27,');
            data.append('0,0,1,1-.36,1.24,1.24,0,0,1,1,.');
            data.append('36,1.71,1.71,0,0,1,.3,1.09v1.7c');
            data.append('0,.69-.21,1.14-.63,1.33a2.22,2.');
            data.append('22,0,0,0,.45.44l-.15.54A1.4,1.4');
            data.append(',0,0,1,18.05,10.45ZM17.9,9.17a1');
            data.append('.1,1.1,0,0,0,.1-.5V6.59a1.06,1.');
            data.append('06,0,0,0-.1-.49.5.5,0,0,0-.75,0');
            data.append(',1,1,0,0,0-.09.49V8.67a1.09,1.0');
            data.append('9,0,0,0,.09.5.4.4,0,0,0,.38.18A');
            data.append('.38.38,0,0,0,17.9,9.17Z\\"/><pa');
            data.append('th d=\\"M19.88,9.77a.86.86,0,0,');
            data.append('1-.39-.5,2.8,2.8,0,0,1-.11-.84v');
            data.append('-3h.8V8.53a1.58,1.58,0,0,0,.09.');
            data.append('6.45.45,0,0,0,.76,0,1.58,1.58,0');
            data.append(',0,0,.09-.6V5.38h.8V8.43a2.73,2');
            data.append('.73,0,0,1-.11.83.93.93,0,0,1-.3');
            data.append('9.51,1.74,1.74,0,0,1-1.54,0Z\\"');
            data.append('/><path d=\\"M23.21,5.38h.88L25');
            data.append(',9.89h-.77l-.18-1h-.78l-.19,1h-');
            data.append('.77Zm.76,3-.31-1.9-.31,1.9Z\\"/');
            data.append('><path d=\\"M25.42,5.38h.82v4h1');
            data.append('.1v.56H25.42Z\\"/><path d=\\"M2');
            data.append('7.76,5.38h.81V9.89h-.81Z\\"/><p');
            data.append('ath d=\\"M29.68,6h-.75v-.6h2.31');
            data.append('V6H30.5V9.89h-.82Z\\"/><path d=');
            data.append('\\"M32.21,8.17l-.92-2.79h.77l.5');
            data.append('6,1.79.53-1.79h.75L33,8.17V9.89');
            data.append('h-.78Z\\"/><path d=\\"M16.3,12.');
            data.append('75h1.89v.58H17.12v1.3H18v.57h-.');
            data.append('84v1.5H18.2v.57H16.3Z\\"/><path');
            data.append(' d=\\"M18.65,12.75h1.07a2,2,0,0');
            data.append(',1,.86.15.92.92,0,0,1,.44.45,2,');
            data.append('2,0,0,1,.13.81V15.8a2.16,2.16,0');
            data.append(',0,1-.13.83.93.93,0,0,1-.44.48,');
            data.append('1.88,1.88,0,0,1-.83.16h-1.1Zm1.');
            data.append('08,3.94a.72.72,0,0,0,.4-.09.43.');
            data.append('43,0,0,0,.15-.27,3.07,3.07,0,0,');
            data.append('0,0-.5V14.1a2.69,2.69,0,0,0,0-.');
            data.append('46.4.4,0,0,0-.17-.23.77.77,0,0,');
            data.append('0-.39-.07h-.25v3.35Z\\"/><path');
            data.append(' d=\\"M22.2,17.15a.91.91,0,0,1-');
            data.append('.39-.51,2.49,2.49,0,0,1-.11-.83');
            data.append('V12.75h.8V15.9a1.58,1.58,0,0,0,');
            data.append('.09.6.45.45,0,0,0,.76,0,1.58,1.');
            data.append('58,0,0,0,.09-.6V12.75h.8v3.06a2');
            data.append('.78,2.78,0,0,1-.11.83,1,1,0,0,1');
            data.append('-.39.51,1.44,1.44,0,0,1-.77.18A');
            data.append('1.39,1.39,0,0,1,22.2,17.15Z\\"/');
            data.append('><path d=\\"M25.08,16.93a1.79,1');
            data.append('.79,0,0,1-.3-1.11V14.21a1.85,1.');
            data.append('85,0,0,1,.29-1.12,1.18,1.18,0,0');
            data.append(',1,1-.39A1.13,1.13,0,0,1,27,13a');
            data.append('1.43,1.43,0,0,1,.28,1v.38H26.5V');
            data.append('14a3.47,3.47,0,0,0,0-.38.35.35,');
            data.append('0,0,0-.4-.31.38.38,0,0,0-.3.1.4');
            data.append('1.41,0,0,0-.13.24,2.17,2.17,0,0');
            data.append(',0,0,.4v2a1.1,1.1,0,0,0,.1.55.3');
            data.append('7.37,0,0,0,.36.17.39.39,0,0,0,.');
            data.append('28-.09.46.46,0,0,0,.12-.24,3.68');
            data.append(',3.68,0,0,0,0-.39v-.41h.79V16A1');
            data.append('.66,1.66,0,0,1,27,17a1.43,1.43,');
            data.append('0,0,1-1.94,0Z\\"/><path d=\\"M2');
            data.append('8.51,12.75h.88l.91,4.52h-.77l-.');
            data.append('17-1.05h-.79l-.18,1.05h-.78Zm.7');
            data.append('6,2.95L29,13.81l-.31,1.89Z\\"/>');
            data.append('<path d=\\"M31,13.36h-.76v-.61h');
            data.append('2.32v.61h-.74v3.91H31Z\\"/><pat');
            data.append('h d=\\"M32.93,12.75h.82v4.52h-.');
            data.append('82Z\\"/><path d=\\"M34.64,17a1.');
            data.append('74,1.74,0,0,1-.3-1.1V14.16a1.69');
            data.append(',1.69,0,0,1,.3-1.09,1.24,1.24,0');
            data.append(',0,1,1-.37,1.22,1.22,0,0,1,1,.3');
            data.append('7,1.69,1.69,0,0,1,.3,1.09v1.69a');
            data.append('1.68,1.68,0,0,1-.31,1.1,1.2,1.2');
            data.append(',0,0,1-1,.38A1.24,1.24,0,0,1,34');
            data.append('.64,17Zm1.38-.4a1.12,1.12,0,0,0');
            data.append(',.09-.5V14a1.09,1.09,0,0,0-.09-');
            data.append('.5.39.39,0,0,0-.37-.17.41.41,0,');
            data.append('0,0-.38.17,1.12,1.12,0,0,0-.09.');
            data.append('5v2.08a1.12,1.12,0,0,0,.09.5.41');
            data.append('.41,0,0,0,.38.17A.4.4,0,0,0,36,');
            data.append('16.55Z\\"/><path d=\\"M37.53,12');
            data.append('.75h.57l1.1,2.58V12.75h.68v4.52');
            data.append('h-.55l-1.1-2.7v2.7h-.7Z\\"/><po');
            data.append('lygon points=\\"27.44 33.21 16.');
            data.append('29 26.77 16.29 47.61 27.44 50.9');
            data.append('8 27.44 33.21\\"/><polygon poin');
            data.append('ts=\\"28.67 33.26 28.67 50.99 3');
            data.append('9.9 47.61 39.9 26.77 28.67 33.2');
            data.append('6\\"/><polygon points=\\"46.35');
            data.append(' 47.24 46.02 47.24 47.34 51.86');
            data.append(' 48.66 47.24 48.33 47.24 48.66');
            data.append(' 47.24 48.66 28.7 48.33 28.7 48');
            data.append(' 28.7 47.66 28.7 47 28.7 46.67');
            data.append(' 28.7 46.35 28.7 46.02 28.7 46.');
            data.append('02 47.24 46.35 47.24\\"/><polyg');
            data.append('on points=\\"42.3 27.67 41.1 26');
            data.append('.72 41.1 48.18 28.7 52.18 28.13');
            data.append(' 52.18 28.02 52.18 27.44 52.18');
            data.append(' 15.1 48.73 15.1 26.72 13.9 27.');
            data.append('67 13.9 49.58 27.39 53.31 28.02');
            data.append(' 53.31 28.13 53.31 28.76 53.31');
            data.append(' 41.2 49.36 42.3 49.03 42.3 27.');
            data.append('67\\"/><path d=\\"M48.66,26.24a');
            data.append('1.32,1.32,0,1,0-2.64,0v1.43h2.6');
            data.append('4Z\\"/></g></svg>');

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
    #[available_gas(847000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @121_u32, 'Couldn\'t get data');
        let mut arr: Array<felt252> = ArrayTrait::new();
    }
}
