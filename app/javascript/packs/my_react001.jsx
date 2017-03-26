// ../../views/frontend/my_react001.html.slim で javascript_pack_tag "my_react001_show" している

import React from 'react'
import ReactDOM from 'react-dom'

const MyReact001 = props => (
  <div>MyReact001 {props.name}</div>
)

MyReact001.defaultProps = {
  name: 'David'
}

MyReact001.propTypes = {
  name: React.PropTypes.string
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <MyReact001 name="Reactの動作OK" />,
    document.body.appendChild(document.createElement('div')),
  )
})
