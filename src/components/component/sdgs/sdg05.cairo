const NAME: felt252 = 'SDG05.svg';

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

            data.append(' id=\\"SDG5\\" xmlns=\\"http://w');
            data.append('ww.w3.org/2000/svg\\" viewBox=');
            data.append('\\"0 0 61.84 61.84\\"><rect fil');
            data.append('l=\\"%23ef412a\\" width=\\"61.84');
            data.append('\\" height=\\"61.84\\"/><g fill');
            data.append('=\\"%23fff\\"><path d=\\"M6.2,16.');
            data.append('93a2.14,2.14,0,0,1-.92-1.22,6.4');
            data.append(',6.4,0,0,1-.25-2H7.21a4.36,4.36');
            data.append(',0,0,0,.19,1.48.75.75,0,0,0,.75');
            data.append('.46.72.72,0,0,0,.64-.3A1.64,1.6');
            data.append('4,0,0,0,9,14.6a13.62,13.62,0,0,');
            data.append('0,.05-1.45,5,5,0,0,0-.19-1.61A.');
            data.append('79.79,0,0,0,8.09,11c-.53,0-.86.');
            data.append('36-1,1.07H5.15l.16-6.7h5.43V7.3');
            data.append('1H7.16L7,9.92a1.48,1.48,0,0,1,.');
            data.append('69-.41,3.12,3.12,0,0,1,1.07-.17');
            data.append(',2,2,0,0,1,1.82,1,5.25,5.25,0,0');
            data.append(',1,.61,2.74A8.88,8.88,0,0,1,11,');
            data.append('15.37,2.63,2.63,0,0,1,10,16.83a');
            data.append('3.21,3.21,0,0,1-2,.53A3.37,3.37');
            data.append(',0,0,1,6.2,16.93Z\\"/><path d=');
            data.append('\\"M16.48,9.54a2,2,0,0,1-.28-1.');
            data.append('15V6.88a2,2,0,0,1,.29-1.17,1.17');
            data.append(',1.17,0,0,1,1-.39,1.2,1.2,0,0,1');
            data.append(',1,.33,1.42,1.42,0,0,1,.29,1v.2');
            data.append('4H18V6.61a2.06,2.06,0,0,0,0-.39');
            data.append('A.33.33,0,0,0,17.79,6a.46.46,0,');
            data.append('0,0-.29-.08.41.41,0,0,0-.31.1.5');
            data.append('3.53,0,0,0-.13.26,2.17,2.17,0,0');
            data.append(',0,0,.4V8.57a1.19,1.19,0,0,0,.1');
            data.append('.57.49.49,0,0,0,.78,0,1.31,1.31');
            data.append(',0,0,0,.11-.6V8.11h-.49V7.59h1.');
            data.append('23V9.88h-.54l0-.44a.78.78,0,0,1');
            data.append('-.77.5A1,1,0,0,1,16.48,9.54Z\\"');
            data.append('/><path d=\\"M19.36,5.37h1.89V6');
            data.append('H20.18v1.3H21v.57h-.84v1.5h1.08');
            data.append('v.56h-1.9Z\\"/><path d=\\"M21.7');
            data.append('1,5.37h.57l1.1,2.57V5.37h.68V9.');
            data.append('88h-.55l-1.1-2.7v2.7h-.7Z\\"/><');
            data.append('path d=\\"M24.72,5.37h1.06a2,2,');
            data.append('0,0,1,.86.15.88.88,0,0,1,.44.45');
            data.append(',2,2,0,0,1,.13.8V8.41a2.12,2.12');
            data.append(',0,0,1-.13.83.9.9,0,0,1-.44.48,');
            data.append('1.75,1.75,0,0,1-.83.16H24.72ZM2');
            data.append('5.79,9.3a.7.7,0,0,0,.4-.09A.4.4');
            data.append(',0,0,0,26.34,9a3.08,3.08,0,0,0,');
            data.append('0-.51V6.72a2.43,2.43,0,0,0,0-.4');
            data.append('6A.36.36,0,0,0,26.17,6,.76.76,0');
            data.append(',0,0,25.78,6h-.24V9.3Z\\"/><pat');
            data.append('h d=\\"M27.79,5.37h1.89V6H28.61');
            data.append('v1.3h.84v.57h-.84v1.5h1.08v.56h');
            data.append('-1.9Z\\"/><path d=\\"M30.14,5.3');
            data.append('7h1.09a1.72,1.72,0,0,1,1.06.27,');
            data.append('1.09,1.09,0,0,1,.35.93,1.76,1.7');
            data.append('6,0,0,1-.12.7.79.79,0,0,1-.43.3');
            data.append('9l.63,2.22h-.83l-.54-2.07H31V9.');
            data.append('88h-.82ZM31.22,7.3a.64.64,0,0,0');
            data.append(',.5-.16.76.76,0,0,0,.15-.53.81.');
            data.append('81,0,0,0-.13-.52.62.62,0,0,0-.4');
            data.append('7-.16H31V7.3Z\\"/><path d=\\"M1');
            data.append('6.27,12.73h1.9v.58H17.09v1.3h.8');
            data.append('5v.57h-.85v1.5h1.09v.56H16.27Z');
            data.append('\\"/><path d=\\"M20.38,17.8a3.2');
            data.append('7,3.27,0,0,1-.43-.5h-.09a1.2,1.');
            data.append('2,0,0,1-1-.37,1.74,1.74,0,0,1-.');
            data.append('3-1.1V14.14a1.71,1.71,0,0,1,.3-');
            data.append('1.09,1.23,1.23,0,0,1,1-.37,1.22');
            data.append(',1.22,0,0,1,1,.37,1.71,1.71,0,0');
            data.append(',1,.31,1.09v1.69c0,.69-.21,1.14');
            data.append('-.63,1.33a2.22,2.22,0,0,0,.45.4');
            data.append('4l-.15.54A1.4,1.4,0,0,1,20.38,1');
            data.append('7.8Zm-.15-1.28a1.1,1.1,0,0,0,.1');
            data.append('-.5V14a1.1,1.1,0,0,0-.1-.5.39.3');
            data.append('9,0,0,0-.37-.16c-.19,0-.31.05-.');
            data.append('37.16a1,1,0,0,0-.1.5V16a1,1,0,0');
            data.append(',0,.1.5.37.37,0,0,0,.37.18A.38.');
            data.append('38,0,0,0,20.23,16.52Z\\"/><path');
            data.append(' d=\\"M22.21,17.13a.91.91,0,0,1');
            data.append('-.39-.51,2.52,2.52,0,0,1-.11-.8');
            data.append('4v-3h.8v3.15a1.58,1.58,0,0,0,.0');
            data.append('9.6.45.45,0,0,0,.76,0,1.58,1.58');
            data.append(',0,0,0,.09-.6V12.73h.79v3a2.52,');
            data.append('2.52,0,0,1-.11.84.91.91,0,0,1-.');
            data.append('39.51,1.81,1.81,0,0,1-1.53,0Z\\');
            data.append('"/><path d=\\"M25.54,12.73h.87l');
            data.append('.91,4.51h-.77l-.17-1h-.79l-.18,');
            data.append('1h-.78Zm.75,2.95L26,13.79l-.31,');
            data.append('1.89Z\\"/><path d=\\"M27.74,12.');
            data.append('73h.82v3.95h1.09v.56H27.74Z\\"/');
            data.append('><path d=\\"M30.08,12.73h.81v4.');
            data.append('51h-.81Z\\"/><path d=\\"M32,13.');
            data.append('34h-.75v-.61h2.31v.61h-.74v3.9H');
            data.append('32Z\\"/><path d=\\"M34.52,15.52');
            data.append('l-.91-2.79h.76l.56,1.79.52-1.79');
            data.append('h.76l-.91,2.79v1.72h-.78Z\\"/><');
            data.append('path d=\\"M45.11,23.36H37.39a.1');
            data.append('.1,0,0,0-.1.1V26a.1.1,0,0,0,.1.');
            data.append('1h3.07l-3.41,3.41a10.11,10.11,0');
            data.append(',1,0-7.54,18v3H26.46a.1.1,0,0,0');
            data.append('-.1.09v2.75a.1.1,0,0,0,.1.1h3.0');
            data.append('5v2.91a.09.09,0,0,0,.1.1h2.74a.');
            data.append('09.09,0,0,0,.1-.1V53.42h3a.1.1,');
            data.append('0,0,0,.1-.1V50.57a.1.1,0,0,0-.1');
            data.append('-.09h-3v-3a10.11,10.11,0,0,0,6.');
            data.append('63-15.79l3.36-3.37v2.87a.1.1,0,');
            data.append('0,0,.1.1h2.57a.1.1,0,0,0,.1-.1V');
            data.append('23.46a.11.11,0,0,0-.1-.1M30.81,');
            data.append('44.94a7.45,7.45,0,1,1,7.45-7.45');
            data.append(',7.45,7.45,0,0,1-7.45,7.45\\"/>');
            data.append('<path d=\\"M35.36,34.44h-9a.1.1');
            data.append(',0,0,0-.1.09v2.18a.1.1,0,0,0,.1');
            data.append('.09h9a.1.1,0,0,0,.1-.09V34.53a.');
            data.append('1.1,0,0,0-.1-.09\\"/><path d=\\');
            data.append('"M35.36,38.34h-9a.1.1,0,0,0-.1.');
            data.append('09v2.19a.1.1,0,0,0,.1.09h9a.1.1');
            data.append(',0,0,0,.1-.09V38.43a.1.1,0,0,0-');
            data.append('.1-.09\\"/></g></svg>');

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
    #[available_gas(833000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @119_u32, 'Couldn\'t get data');
    }
}
