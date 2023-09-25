const NAME: felt252 = 'SDG14.svg';

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

            data.append(' id=\\"SDG14\\" xmlns=\\"http://');
            data.append('www.w3.org/2000/svg\\" viewBox=');
            data.append('\\"0 0 62.06 62.06\\"><rect fil');
            data.append('l=\\"#007dbb\\" width=\\"62.06');
            data.append('\\" height=\\"62.06\\"/><g fill');
            data.append('=\\"#fff\\"><path d=\\"M5.32,7.');
            data.append('73a8.3,8.3,0,0,1-.93.37c-.41.14');
            data.append('-.67.23-.78.28V6.7a9.28,9.28,0,');
            data.append('0,0,1.21-.59,4.26,4.26,0,0,0,1-');
            data.append('.71H7.59V17.23H5.32Z\\"/><path');
            data.append(' d=\\"M12.14,14.43H8.58V12.64L1');
            data.append('1.66,5.4h2.53v7.32h1.18v1.71H14');
            data.append('.19v2.8h-2Zm0-1.71v-5l-1.79,5Z');
            data.append('\\"/><path d=\\"M19.83,9.91V5.3');
            data.append('9h.83v4h1.1v.57Z\\"/><path d=\\');
            data.append('"M22,9.91V5.39h.81V9.91Z\\"/><p');
            data.append('ath d=\\"M23.36,9.91V5.39h1.86V');
            data.append('6h-1V7.28H25v.57h-.84V9.91Z\\"/');
            data.append('><path d=\\"M25.49,9.91V5.39h1.');
            data.append('9V6H26.31v1.3h.85v.58h-.85V9.34');
            data.append('H27.4v.57Z\\"/><path d=\\"M19.8');
            data.append('3,17.3V12.78H21a2.92,2.92,0,0,1');
            data.append(',.54.05,1.15,1.15,0,0,1,.42.19.');
            data.append('82.82,0,0,1,.27.36,1.49,1.49,0,');
            data.append('0,1,.09.56,1.33,1.33,0,0,1-.07.');
            data.append('47.7.7,0,0,1-.22.31.73.73,0,0,1');
            data.append('-.36.15,1,1,0,0,1,.44.19.89.89,');
            data.append('0,0,1,.26.37,1.51,1.51,0,0,1,.0');
            data.append('9.55,2,2,0,0,1-.08.58,1.27,1.27');
            data.append(',0,0,1-.24.41,1.09,1.09,0,0,1-.');
            data.append('4.25,1.55,1.55,0,0,1-.55.08Zm.8');
            data.append('3-2.67h.28a.8.8,0,0,0,.38-.08.3');
            data.append('8.38,0,0,0,.19-.22,1.35,1.35,0,');
            data.append('0,0,0-.38.75.75,0,0,0-.08-.37.4');
            data.append('3.43,0,0,0-.24-.18,1.61,1.61,0,');
            data.append('0,0-.42-.05h-.16Zm0,2.09H21a.6.');
            data.append('6,0,0,0,.51-.18.94.94,0,0,0,.14');
            data.append('-.56,1.31,1.31,0,0,0-.07-.44.46');
            data.append('.46,0,0,0-.21-.26A.87.87,0,0,0,');
            data.append('21,15.2h-.29Z\\"/><path d=\\"M2');
            data.append('2.78,17.3V12.78h1.9v.58H23.6v1.');
            data.append('3h.85v.58H23.6v1.49h1.09v.57Z\\');
            data.append('"/><path d=\\"M25,17.3V12.78h.8');
            data.append('3v4h1.09v.57Z\\"/><path d=\\"M2');
            data.append('8.36,17.36a1.54,1.54,0,0,1-.77-');
            data.append('.17,1,1,0,0,1-.41-.52,2.34,2.34');
            data.append(',0,0,1-.12-.79V14.19a2.3,2.3,0,');
            data.append('0,1,.12-.79,1,1,0,0,1,.41-.5,1.');
            data.append('54,1.54,0,0,1,.77-.17,1.52,1.52');
            data.append(',0,0,1,.77.17,1,1,0,0,1,.41.5,2');
            data.append('.3,2.3,0,0,1,.12.79v1.69a2.3,2.');
            data.append('3,0,0,1-.12.79,1,1,0,0,1-.41.51');
            data.append('A1.42,1.42,0,0,1,28.36,17.36Zm0');
            data.append('-.6a.41.41,0,0,0,.3-.09.43.43,0');
            data.append(',0,0,.13-.25,1.22,1.22,0,0,0,0-');
            data.append('.34V14a1.18,1.18,0,0,0,0-.34.41');
            data.append('.41,0,0,0-.13-.24.41.41,0,0,0-.');
            data.append('3-.09.45.45,0,0,0-.3.09.41.41,0');
            data.append(',0,0-.13.24,1.18,1.18,0,0,0,0,.');
            data.append('34v2.08a1.79,1.79,0,0,0,0,.34.4');
            data.append('4.44,0,0,0,.14.25A.41.41,0,0,0,');
            data.append('28.36,16.76Z\\"/><path d=\\"M30');
            data.append('.58,17.3l-.64-4.52h.69L31,15.71');
            data.append('l.47-2.92H32l.48,2.92.37-2.93h.');
            data.append('68l-.63,4.52h-.67l-.51-3-.49,3Z');
            data.append('\\"/><path d=\\"M35.57,17.3l-.6');
            data.append('4-4.52h.69L36,15.71l.47-2.92H37');
            data.append('l.48,2.92.37-2.93h.68l-.63,4.52');
            data.append('h-.67l-.51-3-.49,3Z\\"/><path d');
            data.append('=\\"M38.53,17.3l.91-4.52h.88l.9');
            data.append('1,4.52h-.77l-.18-1h-.79l-.18,1Z');
            data.append('m1-1.57h.61l-.3-1.9Z\\"/><path');
            data.append(' d=\\"M41.75,17.3V13.39H41v-.61');
            data.append('h2.26v.61h-.71V17.3Z\\"/><path');
            data.append(' d=\\"M43.53,17.3V12.78h1.9v.58');
            data.append('H44.36v1.3h.84v.58h-.84v1.49h1.');
            data.append('08v.57Z\\"/><path d=\\"M45.76,1');
            data.append('7.3V12.78h1.08a2.2,2.2,0,0,1,.7');
            data.append('7.11.85.85,0,0,1,.48.37,1.31,1.');
            data.append('31,0,0,1,.17.71,2.49,2.49,0,0,1');
            data.append(',0,.5,1.14,1.14,0,0,1-.17.37.73');
            data.append('.73,0,0,1-.33.23l.63,2.23h-.83L');
            data.append('47,15.23h-.38V17.3Zm.82-2.59h.2');
            data.append('6a.81.81,0,0,0,.38-.07.41.41,0,');
            data.append('0,0,.21-.22,1.12,1.12,0,0,0,.06');
            data.append('-.4.84.84,0,0,0-.13-.51.57.57,0');
            data.append(',0,0-.48-.17h-.3Z\\"/><path d=');
            data.append('\\"M47.72,45.34c-.78-1.06-5.85-');
            data.append('7.52-13-7.52-6.17,0-12.77,5.6-1');
            data.append('2.77,5.6s-2.48-5.08-7.55-5.56h-');
            data.append('.12c-.11,0-.21.11-.2.2a.77.77,0');
            data.append(',0,0,.08.19,15.41,15.41,0,0,1,2');
            data.append('.32,7.25,15.53,15.53,0,0,1-2.32');
            data.append(',7.27l0,.07a.45.45,0,0,0,0,.11.');
            data.append('21.21,0,0,0,.19.2h.11c5.09-.47,');
            data.append('7.57-5.56,7.57-5.56s6.6,5.59,12');
            data.append('.77,5.59c7.11,0,12.18-6.46,13-7');
            data.append('.52l.06-.07a.19.19,0,0,0,0-.08.');
            data.append('17.17,0,0,0,0-.07l-.06-.08m-9,1');
            data.append('a2.08,2.08,0,1,1,2.07-2.07,2.08');
            data.append(',2.08,0,0,1-2.07,2.07\\"/><path');
            data.append(' d=\\"M21.53,32l0-.06a.23.23,0,');
            data.append('0,1,.11,0,.2.2,0,0,1,.14,0h0c3.');
            data.append('88,3.69,7.94.7,8.78,0l.09-.08h.');
            data.append('16L31,32c.84.7,4.91,3.69,8.78,0');
            data.append('h0a.2.2,0,0,1,.14,0A.2.2,0,0,1,');
            data.append('40,32l.06.06c.75.74,4,3.53,7.42');
            data.append('.55a.18.18,0,0,0,.06-.14V31a.2.');
            data.append('2,0,0,0-.2-.2h0l-.11.06a6.25,6.');
            data.append('25,0,0,1-7.29-1l-.09-.08-.09,0-');
            data.append('.06,0a.14.14,0,0,0-.1.07c-.88.6');
            data.append('8-4.95,3.43-8.57.05l-.05-.05a.2');
            data.append('.2,0,0,0-.15-.06.2.2,0,0,0-.14.');
            data.append('06l-.05.05c-3.62,3.38-7.69.63-8');
            data.append('.57-.05a.14.14,0,0,0-.1-.07l-.0');
            data.append('6,0-.09,0-.09.08a6.25,6.25,0,0,');
            data.append('1-7.29,1l-.11-.06h0a.2.2,0,0,0-');
            data.append('.2.2v1.42a.18.18,0,0,0,.06.14c3');
            data.append('.43,3,6.68.19,7.43-.55\\"/><pat');
            data.append('h d=\\"M14.28,25.68h0a.2.2,0,0,');
            data.append('0-.2.2v1.42a.2.2,0,0,0,.06.15c3');
            data.append('.43,3,6.68.18,7.43-.56a.12.12,0');
            data.append(',0,1,0-.05.25.25,0,0,1,.11,0,.1');
            data.append('7.17,0,0,1,.14.06h0c3.88,3.7,7.');
            data.append('94.71,8.78,0l.09-.07.07,0,.09,0');
            data.append(',.08.07c.84.71,4.91,3.7,8.78,0h');
            data.append('0a.17.17,0,0,1,.14-.06.21.21,0,');
            data.append('0,1,.11,0l.06.05c.75.74,4,3.54,');
            data.append('7.42.56a.2.2,0,0,0,.06-.15V25.8');
            data.append('7a.2.2,0,0,0-.2-.2h0l-.11.05a6.');
            data.append('23,6.23,0,0,1-7.29-1l-.09-.09-.');
            data.append('09,0h-.06a.27.27,0,0,0-.1.08c-.');
            data.append('89.68-4.95,3.43-8.57,0l-.05,0a.');
            data.append('21.21,0,0,0-.29,0l-.05,0c-3.62,');
            data.append('3.38-7.69.63-8.57,0a.27.27,0,0,');
            data.append('0-.1-.08h-.06l-.09,0-.09.09a6.2');
            data.append('3,6.23,0,0,1-7.29,1l-.11-.05\\"');
            data.append('/></g></svg>');

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
    #[available_gas(980000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @140_u32, 'Couldn\'t get data');
    }
}
