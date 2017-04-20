// ../../views/frontend/type024_article.html.slim で javascript_pack_tag "type024_article_show" している

import React from 'react'
import ReactDOM from 'react-dom'

const Type024Article = props => (
  <div>Type024Article {props.name}</div>
)

Type024Article.defaultProps = {
  name: 'David'
}

Type024Article.propTypes = {
  name: React.PropTypes.string
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Type024Article name="Reactの動作OK" />,
    document.body.appendChild(document.createElement('div')),
  )
})
