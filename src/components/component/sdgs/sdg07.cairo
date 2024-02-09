const NAME: felt252 = 'SDG07.svg';

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

            data.append(' id=\\"SDG7\\" xmlns=\\"http://w');
            data.append('ww.w3.org/2000/svg\\" viewBox=');
            data.append('\\"0 0 62.02 62.02\\"><rect fil');
            data.append('l=\\"#fdb714\\" width=\\"62.02');
            data.append('\\" height=\\"62.02\\"/><g fill');
            data.append('=\\"#fff\\"><path d=\\"M8.3,7.1');
            data.append('2H5.09V5.39h5.42V6.87L8,17.22H5');
            data.append('.82Z\\"/><path d=\\"M16.22,5.39');
            data.append('h.88L18,9.91h-.77l-.18-1.05h-.7');
            data.append('8l-.19,1.05h-.77Zm.76,3-.31-1.9');
            data.append('-.31,1.9Z\\"/><path d=\\"M18.35');
            data.append(',5.39h1.86V6h-1V7.27H20v.58h-.8');
            data.append('5V9.91h-.82Z\\"/><path d=\\"M20');
            data.append('.54,5.39H22.4V6h-1V7.27h.85v.58');
            data.append('h-.85V9.91h-.82Z\\"/><path d=\\');
            data.append('"M23,9.59a1.74,1.74,0,0,1-.3-1.');
            data.append('1V6.79A1.71,1.71,0,0,1,23,5.7a1');
            data.append('.27,1.27,0,0,1,1-.37,1.25,1.25,');
            data.append('0,0,1,1,.37,1.71,1.71,0,0,1,.3,');
            data.append('1.09v1.7a1.74,1.74,0,0,1-.3,1.1');
            data.append(',1.52,1.52,0,0,1-2,0Zm1.38-.4a1');
            data.append('.16,1.16,0,0,0,.09-.51V6.6a1,1,');
            data.append('0,0,0-.09-.49c-.06-.12-.18-.17-');
            data.append('.37-.17s-.31,0-.37.17a.94.94,0,');
            data.append('0,0-.1.49V8.68a1,1,0,0,0,.1.51.');
            data.append('38.38,0,0,0,.37.17A.4.4,0,0,0,2');
            data.append('4.34,9.19Z\\"/><path d=\\"M25.7');
            data.append('7,5.39h1.09a1.72,1.72,0,0,1,1.0');
            data.append('6.27,1.09,1.09,0,0,1,.35.93,1.7');
            data.append('6,1.76,0,0,1-.12.7.77.77,0,0,1-');
            data.append('.44.39l.64,2.23h-.83L27,7.84h-.');
            data.append('39V9.91h-.82Zm1.08,1.93a.65.65,');
            data.append('0,0,0,.5-.16.76.76,0,0,0,.15-.5');
            data.append('3.88.88,0,0,0-.13-.52A.59.59,0,');
            data.append('0,0,26.89,6h-.3V7.32Z\\"/><path');
            data.append(' d=\\"M28.79,5.39h1.06a2,2,0,0,');
            data.append('1,.86.14.88.88,0,0,1,.45.46,2.1');
            data.append('9,2.19,0,0,1,.13.8V8.44a2.37,2.');
            data.append('37,0,0,1-.13.83,1,1,0,0,1-.44.4');
            data.append('8,1.91,1.91,0,0,1-.83.16h-1.1Zm');
            data.append('1.07,3.94a.67.67,0,0,0,.4-.09A.');
            data.append('49.49,0,0,0,30.42,9a3.07,3.07,0');
            data.append(',0,0,0-.5V6.74a1.76,1.76,0,0,0,');
            data.append('0-.46.36.36,0,0,0-.16-.23.83.83');
            data.append(',0,0,0-.4-.08h-.24V9.33Z\\"/><p');
            data.append('ath d=\\"M32.4,5.39h.88l.9,4.52');
            data.append('h-.76l-.18-1.05h-.79l-.18,1.05h');
            data.append('-.78Zm.75,3-.31-1.9-.3,1.9Z\\"/');
            data.append('><path d=\\"M34.52,5.39h1.12a1.');
            data.append('61,1.61,0,0,1,1,.25,1,1,0,0,1,.');
            data.append('34.88c0,.57-.21.89-.65,1,.52.1.');
            data.append('78.48.78,1.12a1.33,1.33,0,0,1-.');
            data.append('31,1,1.26,1.26,0,0,1-1,.34H34.5');
            data.append('2Zm1.11,1.84a.6.6,0,0,0,.49-.16');
            data.append('.76.76,0,0,0,.13-.51.56.56,0,0,');
            data.append('0-.17-.47A.92.92,0,0,0,35.51,6h');
            data.append('-.16V7.23Zm0,2.1a.62.62,0,0,0,.');
            data.append('51-.18.91.91,0,0,0,.14-.57A.92.');
            data.append('92,0,0,0,36.15,8a.6.6,0,0,0-.51');
            data.append('-.19h-.29V9.33Z\\"/><path d=\\"');
            data.append('M37.52,5.39h.82v4h1.1v.57H37.52');
            data.append('Z\\"/><path d=\\"M39.76,5.39h1.');
            data.append('9V6H40.58v1.3h.85v.57h-.85v1.5h');
            data.append('1.09v.57H39.76Z\\"/><path d=\\"');
            data.append('M44,5.39h.88l.9,4.52H45L44.8,8.');
            data.append('86H44l-.18,1.05h-.78Zm.75,3-.31');
            data.append('-1.9-.3,1.9Z\\"/><path d=\\"M46');
            data.append('.08,5.39h.58L47.76,8V5.39h.68V9');
            data.append('.91h-.55L46.79,7.2V9.91h-.71Z\\');
            data.append('"/><path d=\\"M49,5.39h1.06a2,2');
            data.append(',0,0,1,.86.14.83.83,0,0,1,.44.4');
            data.append('6,2,2,0,0,1,.14.8V8.44a2.14,2.1');
            data.append('4,0,0,1-.14.83.92.92,0,0,1-.43.');
            data.append('48,2,2,0,0,1-.84.16H49Zm1.07,3.');
            data.append('94a.7.7,0,0,0,.4-.09A.43.43,0,0');
            data.append(',0,50.64,9a2.12,2.12,0,0,0,0-.5');
            data.append('V6.74a1.76,1.76,0,0,0,0-.46.34.');
            data.append('34,0,0,0-.17-.23A.76.76,0,0,0,5');
            data.append('0.08,6h-.24V9.33Z\\"/><path d=');
            data.append('\\"M15.77,17a1.79,1.79,0,0,1-.3');
            data.append('-1.11V14.23a1.85,1.85,0,0,1,.29');
            data.append('-1.12,1.18,1.18,0,0,1,1-.39,1.1');
            data.append('6,1.16,0,0,1,.95.34A1.48,1.48,0');
            data.append(',0,1,18,14v.38h-.8V14a2,2,0,0,0');
            data.append(',0-.38.36.36,0,0,0-.11-.22.4.4,');
            data.append('0,0,0-.29-.09.39.39,0,0,0-.3.1.');
            data.append('41.41,0,0,0-.13.24,2.17,2.17,0,');
            data.append('0,0,0,.4v2a1.07,1.07,0,0,0,.1.5');
            data.append('5.36.36,0,0,0,.36.17.43.43,0,0,');
            data.append('0,.28-.08.46.46,0,0,0,.12-.24,3');
            data.append('.9,3.9,0,0,0,0-.4v-.4H18V16a1.6');
            data.append('4,1.64,0,0,1-.28,1,1.12,1.12,0,');
            data.append('0,1-.95.36A1.15,1.15,0,0,1,15.7');
            data.append('7,17Z\\"/><path d=\\"M18.45,12.');
            data.append('77h.82v4h1.1v.56H18.45Z\\"/><pa');
            data.append('th d=\\"M20.69,12.77h1.9v.58H21');
            data.append('.51v1.3h.85v.58h-.85v1.5H22.6v.');
            data.append('56H20.69Z\\"/><path d=\\"M23.64');
            data.append(',12.77h.88l.91,4.52h-.77l-.18-1');
            data.append('H23.7l-.19,1h-.77Zm.75,3-.3-1.8');
            data.append('9-.31,1.89Z\\"/><path d=\\"M25.');
            data.append('77,12.77h.57l1.1,2.58V12.77h.68');
            data.append('v4.52h-.54l-1.11-2.7v2.7h-.7Z\\');
            data.append('"/><path d=\\"M29.94,12.77h1.9v');
            data.append('.58H30.76v1.3h.85v.58h-.85v1.5h');
            data.append('1.09v.56H29.94Z\\"/><path d=\\"');
            data.append('M32.22,12.77h.57l1.1,2.58V12.77');
            data.append('h.68v4.52H34l-1.11-2.7v2.7h-.7Z');
            data.append('\\"/><path d=\\"M35.15,12.77h1.');
            data.append('9v.58H36v1.3h.85v.58H36v1.5h1.0');
            data.append('9v.56H35.15Z\\"/><path d=\\"M37');
            data.append('.43,12.77h1.09a1.72,1.72,0,0,1,');
            data.append('1.06.27,1.09,1.09,0,0,1,.35.93,');
            data.append('1.73,1.73,0,0,1-.12.7.79.79,0,0');
            data.append(',1-.43.39L40,17.29h-.83l-.54-2.');
            data.append('07h-.39v2.07h-.82Zm1.08,1.94a.7');
            data.append('.7,0,0,0,.5-.16.78.78,0,0,0,.15');
            data.append('-.53A.86.86,0,0,0,39,13.5a.59.5');
            data.append('9,0,0,0-.48-.17h-.3v1.38Z\\"/><');
            data.append('path d=\\"M40.66,17a2,2,0,0,1-.');
            data.append('29-1.15V14.28a2,2,0,0,1,.29-1.1');
            data.append('7,1.18,1.18,0,0,1,1-.39,1.21,1.');
            data.append('21,0,0,1,1,.33,1.43,1.43,0,0,1,');
            data.append('.29,1v.23h-.78V14a2.1,2.1,0,0,0');
            data.append(',0-.4A.41.41,0,0,0,42,13.4a.48.');
            data.append('48,0,0,0-.29-.08.46.46,0,0,0-.3');
            data.append('1.1.5.5,0,0,0-.13.26,2.22,2.22,');
            data.append('0,0,0,0,.41V16a1.19,1.19,0,0,0,');
            data.append('.1.57.4.4,0,0,0,.39.19.41.41,0,');
            data.append('0,0,.39-.2,1.33,1.33,0,0,0,.1-.');
            data.append('6v-.42h-.48V15h1.23v2.29H42.4l-');
            data.append('.06-.44a.75.75,0,0,1-.76.5A1,1,');
            data.append('0,0,1,40.66,17Z\\"/><path d=\\"');
            data.append('M44.05,15.57l-.91-2.8h.77l.56,1');
            data.append('.79L45,12.77h.75l-.9,2.8v1.72h-');
            data.append('.79Z\\"/><path d=\\"M31,30.21a9');
            data.append('.14,9.14,0,1,0,9.13,9.13A9.13,9');
            data.append('.13,0,0,0,31,30.21m-.68,3.61a.7');
            data.append('.7,0,0,1,.68-.64.7.7,0,0,1,.68.');
            data.append('64V37a.69.69,0,0,1-.68.63.69.69');
            data.append(',0,0,1-.68-.63ZM31,44a4.75,4.75');
            data.append(',0,0,1-1.41-9.28v1.77a3.1,3.1,0');
            data.append(',1,0,2.82,0V34.74A4.75,4.75,0,0');
            data.append(',1,31,44\\"/><path d=\\"M20.55,');
            data.append('39.26a.76.76,0,0,0-.7-.74h-4a.7');
            data.append('6.76,0,0,0-.71.74.77.77,0,0,0,.');
            data.append('71.76h4a.77.77,0,0,0,.7-.76\\"/');
            data.append('><path d=\\"M46.92,39.26a.75.75');
            data.append(',0,0,0-.7-.74h-4a.76.76,0,0,0-.');
            data.append('7.74.77.77,0,0,0,.7.76h4a.76.76');
            data.append(',0,0,0,.7-.76\\"/><path d=\\"M3');
            data.append('1,55.16a.76.76,0,0,0,.75-.7v-4a');
            data.append('.75.75,0,0,0-1.5,0v4a.77.77,0,0');
            data.append(',0,.75.7\\"/><path d=\\"M44.83,');
            data.append('47.16a.77.77,0,0,0-.24-1l-3.47-');
            data.append('2a.76.76,0,0,0-.75,1.31l3.47,2a');
            data.append('.77.77,0,0,0,1-.3\\"/><path d=');
            data.append('\\"M23.14,53.06a.77.77,0,0,0,1-');
            data.append('.24l2-3.47a.75.75,0,0,0-1.31-.7');
            data.append('4l-2,3.47a.76.76,0,0,0,.3,1\\"/');
            data.append('><path d=\\"M39,53a.78.78,0,0,0');
            data.append(',.3-1l-2-3.47a.75.75,0,0,0-1.3.');
            data.append('75l2,3.47A.77.77,0,0,0,39,53\\"');
            data.append('/><path d=\\"M17.26,47.19a.76.7');
            data.append('6,0,0,0,1,.3l3.47-2A.76.76,0,0,');
            data.append('0,21,44.19l-3.47,2a.76.76,0,0,0');
            data.append('-.23,1\\"/><path d=\\"M31,28.78');
            data.append('a.75.75,0,0,0,.75-.7v-4a.76.76,');
            data.append('0,0,0-.75-.7.77.77,0,0,0-.75.7v');
            data.append('4a.76.76,0,0,0,.75.7\\"/><path');
            data.append(' d=\\"M21.93,34.06a.76.76,0,0,0');
            data.append('-.23-1l-3.47-2a.77.77,0,0,0-1,.');
            data.append('3.79.79,0,0,0,.24,1l3.47,2a.76.');
            data.append('76,0,0,0,1-.3\\"/><path d=\\"M3');
            data.append('6.24,30.17a.77.77,0,0,0,1-.24l2');
            data.append('-3.47a.75.75,0,0,0-1.31-.74l-2,');
            data.append('3.47a.76.76,0,0,0,.3,1\\"/><pat');
            data.append('h d=\\"M25.81,30.18a.77.77,0,0,');
            data.append('0,.3-1l-2-3.47a.76.76,0,0,0-1-.');
            data.append('24.77.77,0,0,0-.3,1l2,3.46a.77.');
            data.append('77,0,0,0,1,.24\\"/><path d=\\"M');
            data.append('40.12,34a.76.76,0,0,0,1,.3l3.47');
            data.append('-2a.75.75,0,0,0-.75-1.3l-3.47,2');
            data.append('a.76.76,0,0,0-.23,1\\"/></g></s');
            data.append('vg>');

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
    #[available_gas(1309000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @187_u32, 'Couldn\'t get data');
    }
}
