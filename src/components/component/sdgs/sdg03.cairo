const NAME: felt252 = 'SDG03.svg';

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

            data.append(' id=\\"SDG3\\" xmlns=\\"http://w');
            data.append('ww.w3.org/2000/svg\\" viewBox=');
            data.append('\\"0 0 61.92 61.92\\"><rect fil');
            data.append('l=\\"#2d9a47\\" width=\\"61.92');
            data.append('\\" height=\\"61.92\\"/><g fill');
            data.append('=\\"#fff\\"><path d=\\"M5.65,16');
            data.append('.46a4.1,4.1,0,0,1-.74-2.63v-.41');
            data.append('H7.15v.39a3.07,3.07,0,0,0,.22,1');
            data.append('.3.76.76,0,0,0,.74.39.73.73,0,0');
            data.append(',0,.73-.4A3.42,3.42,0,0,0,9,13.');
            data.append('8a2.87,2.87,0,0,0-.28-1.41,1.1,');
            data.append('1.1,0,0,0-1-.47,2.38,2.38,0,0,0');
            data.append('-.41,0V10.25h.37a1.22,1.22,0,0,');
            data.append('0,1.05-.4A2.42,2.42,0,0,0,9,8.5');
            data.append('1a2.36,2.36,0,0,0-.21-1.13A.82.');
            data.append('82,0,0,0,8.06,7a.69.69,0,0,0-.7');
            data.append('.39,2.84,2.84,0,0,0-.21,1.17V9.');
            data.append('1H4.91V8.46a3.27,3.27,0,0,1,.82');
            data.append('-2.39,3.11,3.11,0,0,1,2.33-.84A');
            data.append('3.25,3.25,0,0,1,10.42,6a3.18,3.');
            data.append('18,0,0,1,.83,2.35,3.15,3.15,0,0');
            data.append(',1-.43,1.71A1.83,1.83,0,0,1,9.7');
            data.append('5,11c1,.37,1.5,1.3,1.5,2.78a4.2');
            data.append('9,4.29,0,0,1-.76,2.68,2.9,2.9,0');
            data.append(',0,1-2.41,1A2.92,2.92,0,0,1,5.6');
            data.append('5,16.46Z\\"/><path d=\\"M16.5,9');
            data.append('.55a2,2,0,0,1-.28-1.15V6.89a2,2');
            data.append(',0,0,1,.29-1.17,1.18,1.18,0,0,1');
            data.append(',1-.39,1.21,1.21,0,0,1,1,.33,1.');
            data.append('47,1.47,0,0,1,.29,1v.24H18V6.62');
            data.append('a2.06,2.06,0,0,0,0-.39A.33.33,0');
            data.append(',0,0,17.81,6a.4.4,0,0,0-.29-.08');
            data.append('.38.38,0,0,0-.3.1.55.55,0,0,0-.');
            data.append('14.26,2.17,2.17,0,0,0,0,.4V8.58');
            data.append('a1.24,1.24,0,0,0,.11.58.4.4,0,0');
            data.append(',0,.38.19.4.4,0,0,0,.39-.21,1.3');
            data.append('1,1.31,0,0,0,.11-.6V8.12h-.48V7');
            data.append('.6h1.22V9.89h-.53l-.06-.44a.75.');
            data.append('75,0,0,1-.76.5A1.05,1.05,0,0,1,');
            data.append('16.5,9.55Z\\"/><path d=\\"M19.6');
            data.append('1,9.58a1.74,1.74,0,0,1-.3-1.1V6');
            data.append('.78a1.71,1.71,0,0,1,.3-1.09,1.2');
            data.append('5,1.25,0,0,1,1-.36,1.22,1.22,0,');
            data.append('0,1,1,.36,1.71,1.71,0,0,1,.3,1.');
            data.append('09v1.7a1.71,1.71,0,0,1-.3,1.09,');
            data.append('1.17,1.17,0,0,1-1,.38A1.22,1.22');
            data.append(',0,0,1,19.61,9.58ZM21,9.17a1,1,');
            data.append('0,0,0,.1-.5V6.59A1,1,0,0,0,21,6');
            data.append('.1a.38.38,0,0,0-.37-.17.41.41,0');
            data.append(',0,0-.38.17,1.07,1.07,0,0,0-.09');
            data.append('.49V8.67a1.09,1.09,0,0,0,.09.5.');
            data.append('4.4,0,0,0,.38.18A.36.36,0,0,0,2');
            data.append('1,9.17Z\\"/><path d=\\"M22.72,9');
            data.append('.58a1.74,1.74,0,0,1-.3-1.1V6.78');
            data.append('a1.71,1.71,0,0,1,.3-1.09,1.25,1');
            data.append('.25,0,0,1,1-.36,1.22,1.22,0,0,1');
            data.append(',1,.36A1.71,1.71,0,0,1,25,6.78v');
            data.append('1.7a1.71,1.71,0,0,1-.3,1.09,1.1');
            data.append('7,1.17,0,0,1-1,.38A1.22,1.22,0,');
            data.append('0,1,22.72,9.58Zm1.37-.41a1,1,0,');
            data.append('0,0,.1-.5V6.59a1,1,0,0,0-.09-.4');
            data.append('9.38.38,0,0,0-.37-.17.41.41,0,0');
            data.append(',0-.38.17,1.07,1.07,0,0,0-.09.4');
            data.append('9V8.67a1.09,1.09,0,0,0,.09.5.4.');
            data.append('4,0,0,0,.38.18A.36.36,0,0,0,24.');
            data.append('09,9.17Z\\"/><path d=\\"M25.6,5');
            data.append('.38h1.07a2.23,2.23,0,0,1,.86.14');
            data.append('A.9.9,0,0,1,28,6a2,2,0,0,1,.13.');
            data.append('8V8.43a2.19,2.19,0,0,1-.13.83.8');
            data.append('8.88,0,0,1-.44.47,1.75,1.75,0,0');
            data.append(',1-.83.16H25.6Zm1.08,3.94a.64.6');
            data.append('4,0,0,0,.4-.1A.4.4,0,0,0,27.23,');
            data.append('9a3.21,3.21,0,0,0,0-.51V6.73a2.');
            data.append('61,2.61,0,0,0,0-.46A.37.37,0,0,');
            data.append('0,27.06,6,.76.76,0,0,0,26.67,6h');
            data.append('-.25V9.32Z\\"/><path d=\\"M30,5');
            data.append('.38h.82V7.26h.92V5.38h.82V9.89h');
            data.append('-.82v-2h-.92v2H30Z\\"/><path d=');
            data.append('\\"M33.25,5.38h1.89V6H34.06v1.3');
            data.append('h.85v.57h-.85v1.5h1.09v.56h-1.9');
            data.append('Z\\"/><path d=\\"M36.28,5.38h.8');
            data.append('8l.9,4.51H37.3l-.18-1h-.79l-.18');
            data.append(',1h-.78Zm.75,3-.31-1.9-.3,1.9Z');
            data.append('\\"/><path d=\\"M38.48,5.38h.82');
            data.append('v4h1.1v.56H38.48Z\\"/><path d=');
            data.append('\\"M41.13,6h-.75v-.6h2.31V6H42V');
            data.append('9.89h-.82Z\\"/><path d=\\"M43,5');
            data.append('.38h.82V7.26h.92V5.38h.82V9.89h');
            data.append('-.82v-2h-.92v2H43Z\\"/><path d=');
            data.append('\\"M17,12.75h.88l.9,4.52H18l-.1');
            data.append('8-1.05H17l-.19,1.05h-.77Zm.75,2');
            data.append('.95-.3-1.9-.31,1.9Z\\"/><path d');
            data.append('=\\"M19.18,12.75h.57l1.1,2.58V1');
            data.append('2.75h.68v4.52H21l-1.1-2.7v2.7h-');
            data.append('.7Z\\"/><path d=\\"M22.19,12.75');
            data.append('h1.06a2,2,0,0,1,.86.15.84.84,0,');
            data.append('0,1,.44.45,2,2,0,0,1,.13.81V15.');
            data.append('8a2.16,2.16,0,0,1-.13.83.92.92,');
            data.append('0,0,1-.43.48,1.94,1.94,0,0,1-.8');
            data.append('3.16h-1.1Zm1.07,3.94a.7.7,0,0,0');
            data.append(',.4-.09.43.43,0,0,0,.15-.27,2.1');
            data.append('2,2.12,0,0,0,0-.5V14.1a1.86,1.8');
            data.append('6,0,0,0,0-.46.36.36,0,0,0-.17-.');
            data.append('23.77.77,0,0,0-.39-.07H23v3.35Z');
            data.append('\\"/><path d=\\"M26.43,12.75h.6');
            data.append('8l.38,2.93L28,12.76h.55L29,15.6');
            data.append('8l.37-2.93h.68l-.63,4.52h-.67l-');
            data.append('.5-3-.5,3h-.69Z\\"/><path d=\\"');
            data.append('M30.54,12.75h1.89v.58H31.36v1.3');
            data.append('h.84v.57h-.84v1.5h1.08v.57h-1.9');
            data.append('Z\\"/><path d=\\"M32.89,12.75h.');
            data.append('82V16.7h1.1v.57H32.89Z\\"/><pat');
            data.append('h d=\\"M35.21,12.75H36V16.7h1.1');
            data.append('v.57H35.21Z\\"/><path d=\\"M37.');
            data.append('51,15.18h1.34v.52H37.51Z\\"/><p');
            data.append('ath d=\\"M39.48,12.75H40.6a1.58');
            data.append(',1.58,0,0,1,1,.26,1,1,0,0,1,.35');
            data.append('.87c0,.57-.22.89-.65,1q.78.15.7');
            data.append('8,1.11a1.33,1.33,0,0,1-.32,1,1.');
            data.append('24,1.24,0,0,1-.94.34H39.48Zm1.1');
            data.append('1,1.85a.61.61,0,0,0,.48-.16.81.');
            data.append('81,0,0,0,.13-.52.53.53,0,0,0-.1');
            data.append('7-.47,1,1,0,0,0-.56-.12H40.3V14');
            data.append('.6Zm0,2.09a.6.6,0,0,0,.5-.18.9.');
            data.append('9,0,0,0,.14-.56,1,1,0,0,0-.15-.');
            data.append('6.67.67,0,0,0-.52-.19H40.3v1.53');
            data.append('Z\\"/><path d=\\"M42.56,12.75h1');
            data.append('.89v.58H43.38v1.3h.85v.57h-.85v');
            data.append('1.5h1.08v.57h-1.9Z\\"/><path d=');
            data.append('\\"M44.94,12.75h.81v4.52h-.81Z');
            data.append('\\"/><path d=\\"M46.42,12.75H47');
            data.append('l1.09,2.58V12.75h.68v4.52h-.54l');
            data.append('-1.11-2.7v2.7h-.7Z\\"/><path d=');
            data.append('\\"M49.64,16.93a2,2,0,0,1-.28-1');
            data.append('.15V14.26a2,2,0,0,1,.29-1.17,1.');
            data.append('16,1.16,0,0,1,1-.39,1.2,1.2,0,0');
            data.append(',1,1,.33,1.43,1.43,0,0,1,.29,1v');
            data.append('.23h-.78V14a2.06,2.06,0,0,0,0-.');
            data.append('39.41.41,0,0,0-.13-.22.48.48,0,');
            data.append('0,0-.29-.08.46.46,0,0,0-.31.1.5');
            data.append('.5,0,0,0-.13.26,2.22,2.22,0,0,0');
            data.append(',0,.41V16a1.24,1.24,0,0,0,.1.57');
            data.append('.4.4,0,0,0,.39.19.42.42,0,0,0,.');
            data.append('39-.2,1.33,1.33,0,0,0,.11-.6v-.');
            data.append('43h-.49V15h1.23v2.29h-.54l-.05-');
            data.append('.44a.78.78,0,0,1-.77.5A1.06,1.0');
            data.append('6,0,0,1,49.64,16.93Z\\"/><path');
            data.append(' d=\\"M51.86,38.74A2.93,2.93,0,');
            data.append('0,0,49,35.57c-.85,0-1.87.93-2.4');
            data.append('3,1.5-.56-.57-1.52-1.5-2.37-1.5');
            data.append('a3,3,0,0,0-2.89,3.17,3.21,3.21,');
            data.append('0,0,0,.9,2.24h0l4.36,4.37L51,41');
            data.append('h0A3.22,3.22,0,0,0,51.86,38.74Z');
            data.append('\\"/><path d=\\"M33.29,52.48h0a');
            data.append('.72.72,0,0,1-.67-.6L30.37,39,27');
            data.append(',45.2A.71.71,0,0,1,25.68,45L24.');
            data.append('25,35l-2.61,5.85a.71.71,0,0,1-.');
            data.append('65.43H10.86a.72.72,0,0,1,0-1.43');
            data.append('h9.67L24,32.16a.71.71,0,0,1,.76');
            data.append('-.42.72.72,0,0,1,.61.61l1.47,10');
            data.append('.26,3.3-6.13a.73.73,0,0,1,.75-.');
            data.append('37.71.71,0,0,1,.59.58l2,12L41,2');
            data.append('3.81a.72.72,0,0,1,.63-.51.73.73');
            data.append(',0,0,1,.7.4l3.93,8.16a.73.73,0,');
            data.append('0,1-.33,1,.72.72,0,0,1-1-.34L41');
            data.append('.8,26,34,52A.74.74,0,0,1,33.29,');
            data.append('52.48Z\\"/></g></svg>');

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
    #[available_gas(1183000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @169_u32, 'Couldn\'t get data');
    }
}
