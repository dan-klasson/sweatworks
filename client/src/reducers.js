/**
 * URL manipulator reducer. Used for all links throughout the app
 */
export const UrlReducer = (state, action) => {
  const base = process.env.REACT_APP_BASE_URL

  const order = () => {
    return `sort=${ state.inverted ? '-' : '' }published_at`
  }

  const qsUpdateReplace = (uri, key, value) => {
    var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
    var separator = uri.indexOf('?') !== -1 ? "&" : "?";
    if (uri.match(re)) {
      return uri.replace(re, '$1' + key + "=" + value + '$2');
    }
    else {
      return uri + separator + key + "=" + value;
    }
  }

  switch (action.type) {
    case 'index':
      return {
        ...state,
        url: `${ base }/authors/${ action.id }/publications?${ order() }`
      }

    case 'search':
      const q = encodeURIComponent(action.q)
      return {
        ...state ,
        url: `${ base }/publications/search?q=${ q }&${ order() }`
      }

    case 'invert':
      const sort = !state.inverted ? '-published_at' : 'published_at'
      const invert = qsUpdateReplace(state.url, 'sort', sort)
      return {...state, inverted: !state.inverted, url: invert }

    case 'paginate':
      const paginate = qsUpdateReplace(state.url, 'page', action.page)
      return {...state, url: paginate }

    default:
      return {...state, url: `${ base }/publications?${ order() }` }

  }
}