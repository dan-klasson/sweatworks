export const UrlReducer = (state, action) => {
  const base = process.env.REACT_APP_BASE_URL

  const order = () => {
    return `sort=${ state.inverted ? '-' : '' }published_at`
  }
  switch (action.type) {
    case 'index':
      return {
        ...state,
        url: `${base}/authors/${action.id}/publications?${ order() }`
      }
    case 'search':
      return {
        ...state,
        url: `${base}/publications/search?q=${action.q}&${ order() }`
      }
    case 'invert':
      let url = state.url
      if( !state.inverted ) {
        url = url.replace('published_at', '-published_at')
      } else {
        url = url.replace('-published_at', 'published_at')
      }
      return {...state, inverted: !state.inverted, url: url }
    case 'desc':
      return {...state, url: `${base}/publications?${ order() }` }
    case 'asc':
    default:
      return {...state, url: `${base}/publications?${ order() }` }

  }
}