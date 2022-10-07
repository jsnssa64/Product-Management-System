import Units, { UnitType } from '@Data/product/unit/Units'
import * as React from 'react'

export function ProductManager() {
    const propTypes = {}
    const units: UnitType = {
        Grams: new Units("g", "grams"),
        Kilograms: new Units("kg", "kilograms"),
        Millilitres: new Units("ml", "millilitre"),
        Litre: new Units("l", "litre"),
        Centilitre: new Units("cl", "centilitre")
    }

    return (
        <div>
            {/* <ItemsList></ItemsList> */}
        </div>
    )
}

export default ProductManager