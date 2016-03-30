###
Valerian Time
Author: Armin Rosu (hello@armin.ro), Alan Crissey (alancrissey@gmail.com)

A clock widget based on Alan Crissery's codepen (http://codepen.io/TheRealAlan/), comissioned by Valéria Boikova (http://www.valeriaboikova.com/)
###

command: ""

refreshFrequency: 1000

render: (output) -> """
    <svg class="clock" viewBox="0 0 100 100">
		<circle class="clock-face" cx="50" cy="50" r="45"></circle>
		<g class="clock-hands">
			<line class="clock-hand" id="hour" x1="50" x2="50" y1="50" y2="12" style="transform: rotate(325.5deg);"></line>
			<line class="clock-hand" id="min" x1="50" x2="50" y1="50" y2="14" style="transform: rotate(306deg);"></line>
			<line class="clock-hand" id="sec" x1="50" x2="50" y1="50" y2="10" style="transform: rotate(12deg);"></line>
		</g>
	</svg>
"""

style: """
	right: 20px
	bottom: 20px

	.clock
		width: 150px
		height: 150px
		margin: auto
		display: block
		position: relative

	.clock-face
		fill: #222

	.clock-hand
		stroke-width: 2px
		transform-origin: 100% 100%
		transition: all 200ms cubic-bezier(0.680, -0.550, 0.265, 1.550)

	#hour
		stroke: #1de6e4

	#min
		stroke: #f99e44

	#sec
		stroke-width: 1px
		stroke: #ff0000
"""

update: (output, domEl) ->
	r = ( el, deg ) ->
		$(domEl).find("##{el}", domEl).css(
			"transform",
			"rotate( #{deg}deg )"
		)

	d = new Date()

	# Get Seconds
	r('sec', 6 * d.getSeconds())

	# Get Minutes
	r('min', 6 * d.getMinutes())

	# Get Hours
	r('hour',30 * (d.getHours() % 12) + d.getMinutes() / 2)
