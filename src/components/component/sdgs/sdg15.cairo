const NAME: felt252 = 'SDG15.svg';

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

            data.append(' xmlns=\\"ht');
            data.append('tp://www.w3.org/2000/svg\\" vie');
            data.append('wBox=\\"0 0 62.07 62.07\\"> <re');
            data.append('ct fill=\\"#40ae49\\" width=\\"');
            data.append('62.07\\" height=\\"62.07\\" /> ');
            data.append('<path fill=\\"#fff\\" d=\\"M5.2');
            data.append('9,7.74a8.25,8.25,0,0,1-.93.36c-');
            data.append('.41.14-.67.23-.78.28V6.7a9.75,9');
            data.append('.75,0,0,0,1.21-.58,4.31,4.31,0,');
            data.append('0,0,1-.72H7.56V17.24H5.29Z\\" /');
            data.append('> <path fill=\\"#fff\\" d=\\"M1');
            data.append('0,17a2.11,2.11,0,0,1-.92-1.22,6');
            data.append('.47,6.47,0,0,1-.25-2h2.19a4.08,');
            data.append('4.08,0,0,0,.19,1.48.73.73,0,0,0');
            data.append(',.75.46.72.72,0,0,0,.64-.29,1.6');
            data.append('7,1.67,0,0,0,.26-.79c0-.34,0-.8');
            data.append('2,0-1.46a4.93,4.93,0,0,0-.2-1.6');
            data.append('1.78.78,0,0,0-.81-.54c-.53,0-.8');
            data.append('6.36-1,1.07H9L9.14,5.4h5.45V7.3');
            data.append('4H11L10.86,10a1.5,1.5,0,0,1,.7-');
            data.append('.42,3.38,3.38,0,0,1,1.07-.17,2,');
            data.append('2,0,0,1,1.83,1,5.19,5.19,0,0,1,');
            data.append('.61,2.75,9,9,0,0,1-.25,2.33,2.6');
            data.append(',2.6,0,0,1-.94,1.46,3.15,3.15,0');
            data.append(',0,1-2,.54A3.42,3.42,0,0,1,10,1');
            data.append('7Z\\" /> <path fill=\\"#fff\\" ');
            data.append('d=\\"M19.81,9.92V5.39h.83v4h1.0');
            data.append('9v.57Z\\" /> <path fill=\\"#fff');
            data.append('\\" d=\\"M22,9.92V5.39h.82V9.92');
            data.append('Z\\" /> <path fill=\\"#fff\\" d');
            data.append('=\\"M23.34,9.92V5.39H25.2V6h-1V');
            data.append('7.28H25v.57h-.84V9.92Z\\" /> <p');
            data.append('ath fill=\\"#fff\\" d=\\"M25.46');
            data.append(',9.92V5.39h1.9V6H26.29v1.3h.85v');
            data.append('.58h-.85v1.5h1.09v.57Z\\" /> <p');
            data.append('ath fill=\\"#fff\\" d=\\"M21,17');
            data.append('.37a1.44,1.44,0,0,1-.77-.18,1,1');
            data.append(',0,0,1-.4-.51,2.17,2.17,0,0,1-.');
            data.append('13-.8V14.19a2,2,0,0,1,.13-.78.9');
            data.append('1.91,0,0,1,.4-.5,1.44,1.44,0,0,');
            data.append('1,.77-.18,1.39,1.39,0,0,1,.77.1');
            data.append('8.93.93,0,0,1,.41.5,2,2,0,0,1,.');
            data.append('13.78v1.7a2.06,2.06,0,0,1-.13.7');
            data.append('8,1,1,0,0,1-.41.52A1.39,1.39,0,');
            data.append('0,1,21,17.37Zm0-.61a.41.41,0,0,');
            data.append('0,.3-.09.48.48,0,0,0,.14-.24,1.');
            data.append('9,1.9,0,0,0,0-.35V14a1.72,1.72,');
            data.append('0,0,0,0-.34.48.48,0,0,0-.14-.24');
            data.append('.42.42,0,0,0-.3-.08.45.45,0,0,0');
            data.append('-.3.08.47.47,0,0,0-.13.24,1.72,');
            data.append('1.72,0,0,0,0,.34v2.08a1.9,1.9,0');
            data.append(',0,0,0,.35.41.41,0,0,0,.13.24A.');
            data.append('43.43,0,0,0,21,16.76Z\\" /> <pa');
            data.append('th fill=\\"#fff\\" d=\\"M22.79,');
            data.append('17.31V12.78h.57l1.1,2.58V12.78h');
            data.append('.69v4.53H24.6L23.49,14.6v2.71Z');
            data.append('\\" /> <path fill=\\"#fff\\" d=');
            data.append('\\"M26.86,17.31V12.78h.82v4h1.1');
            data.append('v.57Z\\" /> <path fill=\\"#fff');
            data.append('\\" d=\\"M28.81,17.31l.91-4.53h');
            data.append('.88l.9,4.53h-.76l-.18-1h-.79l-.');
            data.append('18,1Zm1.05-1.57h.61l-.31-1.9Z\\');
            data.append('" /> <path fill=\\"#fff\\" d=\\');
            data.append('"M31.77,17.31V12.78h.57l1.1,2.5');
            data.append('8V12.78h.68v4.53h-.54L32.47,14.');
            data.append('6v2.71Z\\" /> <path fill=\\"#ff');
            data.append('f\\" d=\\"M34.64,17.31V12.78h1.');
            data.append('07a2,2,0,0,1,.86.15.9.9,0,0,1,.');
            data.append('45.47,2.21,2.21,0,0,1,.13.79v1.');
            data.append('65a2.39,2.39,0,0,1-.13.82,1,1,0');
            data.append(',0,1-.44.49,1.9,1.9,0,0,1-.84.1');
            data.append('6Zm.83-.58h.25a.63.63,0,0,0,.41');
            data.append('-.1.45.45,0,0,0,.15-.29,3.18,3.');
            data.append('18,0,0,0,0-.47V14.13a1.78,1.78,');
            data.append('0,0,0,0-.44.38.38,0,0,0-.16-.24');
            data.append('.8.8,0,0,0-.4-.08h-.24Z\\" /> <');
            data.append('rect fill=\\"#fff\\" x=\\"23.71');
            data.append('\\" y=\\"42.02\\" width=\\"2.11');
            data.append('\\" height=\\"4.82\\" rx=\\"0.1');
            data.append('4\\" /> <path fill=\\"#fff\\" d');
            data.append('=\\"M45.86,48.79H15.58a.14.14,0');
            data.append(',0,0-.14.14v1.85a.14.14,0,0,0,.');
            data.append('14.14H45.86a.14.14,0,0,0,.14-.1');
            data.append('4V48.93a.14.14,0,0,0-.14-.14\\"');
            data.append(' /> <path fill=\\"#fff\\" d=\\"');
            data.append('M45.86,52.47H15.58a.13.13,0,0,0');
            data.append('-.14.13v1.86a.13.13,0,0,0,.14.1');
            data.append('3H45.86a.13.13,0,0,0,.14-.13V52');
            data.append('.6a.13.13,0,0,0-.14-.13\\" /> <');
            data.append('path fill=\\"#fff\\" d=\\"M40.1');
            data.append(',37a4.54,4.54,0,0,0-2.62-1,3.47');
            data.append(',3.47,0,0,0-2.43,1,.27.27,0,0,0');
            data.append('-.08.19v.17a.24.24,0,0,0,.08.2.');
            data.append('25.25,0,0,0,.22,0h0a.4.4,0,0,0,');
            data.append('.15-.1,2.45,2.45,0,0,1,1.22-.25');
            data.append(',4.57,4.57,0,0,1,3.12,1.31l0,0a');
            data.append('.39.39,0,0,0,.27.11.34.34,0,0,0');
            data.append(',.25-.11l0,0a4.57,4.57,0,0,1,3.');
            data.append('12-1.31,2.42,2.42,0,0,1,1.22.25');
            data.append('.4.4,0,0,0,.17.1.29.29,0,0,0,.1');
            data.append('7,0,.26.26,0,0,0,.2-.25v-.15a.2');
            data.append('1.21,0,0,0-.09-.18A3.47,3.47,0,');
            data.append('0,0,42.71,36a4.49,4.49,0,0,0-2.');
            data.append('61,1\\" /> <path fill=\\"#fff\\');
            data.append('" d=\\"M38.22,24.92a.23.23,0,0,');
            data.append('0-.13.16l0,.11a.25.25,0,0,0,.22');
            data.append('.32h0l.15,0a.53.53,0,0,1,.18,0,');
            data.append('2.61,2.61,0,0,1,2.16,1.41v0a.35');
            data.append('.35,0,0,0,.2.16h.1a.26.26,0,0,0');
            data.append(',.15,0h0a3,3,0,0,1,1.35-.33,2.0');
            data.append('8,2.08,0,0,1,1.38.44.27.27,0,0,');
            data.append('0,.1.11l.1.05h.07a.27.27,0,0,0,');
            data.append('.12,0,.26.26,0,0,0,.13-.16l0-.0');
            data.append('8s0-.05,0-.08a.28.28,0,0,0,0-.1');
            data.append('3,2.27,2.27,0,0,0-2-1.23,3.36,3');
            data.append('.36,0,0,0-1.09.2,2.66,2.66,0,0,');
            data.append('0-2-1.14,2.51,2.51,0,0,0-1.13.2');
            data.append('8\\" /> <path fill=\\"#fff\\" d');
            data.append('=\\"M31.82,29.58v.14a.26.26,0,0');
            data.append(',0,.32.23h.05a.31.31,0,0,0,.13-');
            data.append('.1,2.24,2.24,0,0,1,1.15-.26,3.7');
            data.append('5,3.75,0,0,1,2.4.91l0,0a.33.33,');
            data.append('0,0,0,.23.09h0a.33.33,0,0,0,.23');
            data.append('-.12l0,0a3.64,3.64,0,0,1,2.66-1');
            data.append('.23,1.81,1.81,0,0,1,.79.15.53.5');
            data.append('3,0,0,0,.15.08h.12l.06,0a.25.25');
            data.append(',0,0,0,.17-.26v-.12a.23.23,0,0,');
            data.append('0-.09-.18,3,3,0,0,0-1.93-.76,3.');
            data.append('59,3.59,0,0,0-2.27.94,3.76,3.76');
            data.append(',0,0,0-2-.67,2.88,2.88,0,0,0-2.');
            data.append('15,1,.26.26,0,0,0-.07.19\\" /> ');
            data.append('<path fill=\\"#fff\\" d=\\"M16.');
            data.append('5,32a3.28,3.28,0,0,1,3.28-3.28H');
            data.append('20A4.44,4.44,0,1,1,28.41,31a5,5');
            data.append(',0,0,1-1.08,9.81l-6.62,0h0a3.51');
            data.append(',3.51,0,0,1-2.56-5.92A3.27,3.27');
            data.append(',0,0,1,16.5,32Z\\" /></svg>');

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
    #[available_gas(1_100_000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        //data.len().print();
        assert_eq(@data.len(), @139_u32, 'Couldn\'t get data');
        let mut arr: Array<felt252> = ArrayTrait::new();
    }
}
