
export const UrlReducer = (state, action) => {
  const base = process.env.REACT_APP_BASE_URL
  switch (action.type) {
    case 'index':
      return {
        ...state,
        url: `${base}/authors/${action.id}/publications`
      }
    case 'search':
      return {
        ...state,
        url: `${base}/publications/search?q=${action.q}`
      }
    default:
      return {...state, url: `${base}/publications` }

  }
}