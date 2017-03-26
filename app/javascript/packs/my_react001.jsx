// ../../views/frontend/my_react001.html.slim で javascript_pack_tag "my_react001_show" している

import React from 'react'
import ReactDOM from 'react-dom'

const Hello = props => (
  <div>Hello {props.name}</div>
)

Hello.defaultProps = {
  name: 'David'
}

Hello.propTypes = {
  name: React.PropTypes.string
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Hello name="Reactの動作OK" />,
    document.body.appendChild(document.createElement('div')),
  )
})
