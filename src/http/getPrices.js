import get from './get'
import * as URLS from './hard-coded-urls.js'

export default async function getPrices() {
  return await get(
    URLS.DRIP_API_URL + 'queryPrice'
  )
}
